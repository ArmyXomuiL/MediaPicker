//
//  Created by Alex.M on 10.06.2022.
//

import Foundation
import Photos

import Photos
import SwiftUI

@MainActor
@available(iOS 14, *)
final class DefaultAlbumsProvider: ObservableObject {

    @Published private(set) var albums: [AlbumModel] = []
    @Published private(set) var isLoading: Bool = false

    var mediaSelectionType: MediaSelectionType = .photoAndVideo
    private var reloadTask: Task<Void, Never>?

    private let preferredSmartAlbumOrder: [PHAssetCollectionSubtype] = [
        .smartAlbumUserLibrary,
        .smartAlbumFavorites,
        .smartAlbumSelfPortraits,
        .smartAlbumVideos,
        .smartAlbumLivePhotos,
        .smartAlbumPanoramas,
        .smartAlbumScreenshots
    ]

    func reload() {
        cancelReload()

        PermissionsService.shared.requestPhotoLibraryPermission { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.reloadTask = Task {
                    self.isLoading = true
                    await self.reloadInternal()
                    self.isLoading = false
                }
            }
        }
    }

    func cancelReload() {
        reloadTask?.cancel()
        reloadTask = nil
    }

    // MARK: - Private

    private func reloadInternal() async {
        if Task.isCancelled { return }

        let smartAlbums = fetchSmartAlbums()
        let userAlbums = fetchUserAlbums()

        if Task.isCancelled { return }
        self.albums = smartAlbums + userAlbums
    }

    private func fetchSmartAlbums() -> [AlbumModel] {
        let collections = PHAssetCollection.fetchAssetCollections(
            with: .smartAlbum,
            subtype: .any,
            options: nil
        )

        var result: [AlbumModel] = []

        for subtype in preferredSmartAlbumOrder {
            guard let collection = collection(in: collections, with: subtype)
            else { continue }

            if let album = makeAlbum(from: collection) {
                result.append(album.album)
            }
        }
        return result
    }

    private func fetchUserAlbums() -> [AlbumModel] {
        let collections = PHAssetCollection.fetchAssetCollections(
            with: .album,
            subtype: .any,
            options: nil
        )

        var albumsWithDate: [(AlbumModel, Date)] = []

        collections.enumerateObjects { collection, _, _ in
            if let result = self.makeAlbum(from: collection) {
                albumsWithDate.append((result.album, result.lastAssetDate))
            }
        }

        return albumsWithDate
            .sorted {
                if $0.1 != $1.1 {
                    return $0.1 > $1.1
                }
                return ($0.0.source.localizedTitle ?? "")
                < ($1.0.source.localizedTitle ?? "")
            }
            .map { $0.0 }
    }

    private func makeAlbum(from collection: PHAssetCollection) -> (album: AlbumModel, lastAssetDate: Date)? {
        let options = PHFetchOptions()
        options.sortDescriptors = [
            NSSortDescriptor(key: "creationDate", ascending: false)
        ]
        options.fetchLimit = 1

        let assets = PHAsset.fetchAssets(in: collection, options: options)
        guard let asset = assets.firstObject else { return nil }

        let preview = MediasProvider
            .map(fetchResult: assets, mediaSelectionType: mediaSelectionType)
            .first

        let album = AlbumModel(preview: preview, source: collection)
        return (album, asset.creationDate ?? .distantPast)
    }

    private func collection(
        in collections: PHFetchResult<PHAssetCollection>,
        with subtype: PHAssetCollectionSubtype
    ) -> PHAssetCollection? {

        var result: PHAssetCollection?

        collections.enumerateObjects { collection, _, stop in
            if collection.assetCollectionSubtype == subtype {
                result = collection
                stop.pointee = true
            }
        }

        return result
    }

}
