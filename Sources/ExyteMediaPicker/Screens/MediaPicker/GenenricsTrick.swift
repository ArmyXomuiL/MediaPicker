//
//  SwiftUIView.swift
//  
//
//  Created by Alisa Mylnikova on 18.10.2023.
//

import SwiftUI

// MARK: - Partial genereic specification imitation

@available(iOS 17, *)
public extension MediaPicker where AlbumSelectionContent == EmptyView, CameraSelectionContent == EmptyView, CameraViewContent == EmptyView, CustomCameraGoToSettingsContent == EmptyView {

    init(isPresented: Binding<Bool>,
         onChange: @escaping MediaPickerCompletionClosure) {

        self.init(isPresented: isPresented,
                  onChange: onChange,
                  albumSelectionBuilder: nil,
                  cameraSelectionBuilder: nil,
                  cameraViewBuilder: nil)
    }
}

@available(iOS 17, *)
public extension MediaPicker where CameraSelectionContent == EmptyView, CameraViewContent == EmptyView, CustomCameraGoToSettingsContent == EmptyView {

    init(isPresented: Binding<Bool>,
         onChange: @escaping MediaPickerCompletionClosure,
         albumSelectionBuilder: @escaping AlbumSelectionClosure) {

        self.init(isPresented: isPresented,
                  onChange: onChange,
                  albumSelectionBuilder: albumSelectionBuilder,
                  cameraSelectionBuilder: nil,
                  cameraViewBuilder: nil)
    }
}

@available(iOS 17, *)
public extension MediaPicker where AlbumSelectionContent == EmptyView, CameraViewContent == EmptyView, CustomCameraGoToSettingsContent == EmptyView {

    init(isPresented: Binding<Bool>,
         onChange: @escaping MediaPickerCompletionClosure,
         cameraSelectionBuilder: @escaping CameraSelectionClosure) {

        self.init(isPresented: isPresented,
                  onChange: onChange,
                  albumSelectionBuilder: nil,
                  cameraSelectionBuilder: cameraSelectionBuilder,
                  cameraViewBuilder: nil)
    }
}

@available(iOS 17, *)
public extension MediaPicker where AlbumSelectionContent == EmptyView, CameraSelectionContent == EmptyView, CustomCameraGoToSettingsContent == EmptyView {

    init(isPresented: Binding<Bool>,
         onChange: @escaping MediaPickerCompletionClosure,
         cameraViewBuilder: @escaping CameraViewClosure) {

        self.init(isPresented: isPresented,
                  onChange: onChange,
                  albumSelectionBuilder: nil,
                  cameraSelectionBuilder: nil,
                  cameraViewBuilder: cameraViewBuilder)
    }
}

@available(iOS 17, *)
public extension MediaPicker where CameraViewContent == EmptyView, CustomCameraGoToSettingsContent == EmptyView {

    init(isPresented: Binding<Bool>,
         onChange: @escaping MediaPickerCompletionClosure,
         albumSelectionBuilder: @escaping AlbumSelectionClosure,
         cameraSelectionBuilder: @escaping CameraSelectionClosure) {

        self.init(isPresented: isPresented,
                  onChange: onChange,
                  albumSelectionBuilder: albumSelectionBuilder,
                  cameraSelectionBuilder: cameraSelectionBuilder,
                  cameraViewBuilder: nil)
    }
}

@available(iOS 17, *)
public extension MediaPicker where CameraViewContent == EmptyView, CustomCameraGoToSettingsContent == EmptyView {

    init(isPresented: Binding<Bool>,
         onChange: @escaping MediaPickerCompletionClosure,
         albumSelectionBuilder: @escaping AlbumSelectionClosure,
         cameraViewBuilder: @escaping CameraViewClosure) {

        self.init(isPresented: isPresented,
                  onChange: onChange,
                  albumSelectionBuilder: albumSelectionBuilder,
                  cameraSelectionBuilder: nil,
                  cameraViewBuilder: cameraViewBuilder)
    }
}

@available(iOS 17, *)
public extension MediaPicker where AlbumSelectionContent == EmptyView, CustomCameraGoToSettingsContent == EmptyView {

    init(isPresented: Binding<Bool>,
         onChange: @escaping MediaPickerCompletionClosure,
         cameraSelectionBuilder: @escaping CameraSelectionClosure,
         cameraViewBuilder: @escaping CameraViewClosure) {

        self.init(isPresented: isPresented,
                  onChange: onChange,
                  albumSelectionBuilder: nil,
                  cameraSelectionBuilder: cameraSelectionBuilder,
                  cameraViewBuilder: cameraViewBuilder)
    }
}

@available(iOS 17, *)
public extension MediaPicker where AlbumSelectionContent == EmptyView, CameraSelectionContent == EmptyView, CameraViewContent == EmptyView, CustomCameraGoToSettingsContent == EmptyView {

    init(isPresented: Binding<Bool>,
         onChange: @escaping MediaPickerCompletionClosure,
         cameraCellTap: (() -> ())? = nil) {

        self.init(isPresented: isPresented,
                  onChange: onChange,
                  albumSelectionBuilder: nil,
                  cameraSelectionBuilder: nil,
                  cameraViewBuilder: nil,
                  cameraCellTap: cameraCellTap)
    }
}

@available(iOS 17, *)
public extension MediaPicker where CameraSelectionContent == EmptyView, CameraViewContent == EmptyView, CustomCameraGoToSettingsContent == EmptyView {

    init(isPresented: Binding<Bool>,
         onChange: @escaping MediaPickerCompletionClosure,
         albumSelectionBuilder: @escaping AlbumSelectionClosure,
         cameraCellTap: (() -> ())? = nil) {

        self.init(isPresented: isPresented,
                  onChange: onChange,
                  albumSelectionBuilder: albumSelectionBuilder,
                  cameraSelectionBuilder: nil,
                  cameraViewBuilder: nil,
                  cameraCellTap: cameraCellTap)
    }
}

@available(iOS 17, *)
public extension MediaPicker where AlbumSelectionContent == EmptyView, CustomCameraGoToSettingsContent == EmptyView {

    init(isPresented: Binding<Bool>,
         onChange: @escaping MediaPickerCompletionClosure,
         cameraSelectionBuilder: @escaping CameraSelectionClosure,
         cameraViewBuilder: @escaping CameraViewClosure,
         cameraCellTap: (() -> ())? = nil) {

        self.init(isPresented: isPresented,
                  onChange: onChange,
                  albumSelectionBuilder: nil,
                  cameraSelectionBuilder: cameraSelectionBuilder,
                  cameraViewBuilder: cameraViewBuilder,
                  cameraCellTap: cameraCellTap)
    }
}

@available(iOS 17, *)
public extension MediaPicker where AlbumSelectionContent == EmptyView, CameraSelectionContent == EmptyView, CameraViewContent == EmptyView {

    init(isPresented: Binding<Bool>,
         onChange: @escaping MediaPickerCompletionClosure,
         cameraCellTap: (() -> ())? = nil,
         customCameraGoToSettingsButton: CustomCameraGoToSettingsButtonClosure? = nil) {

        self.init(isPresented: isPresented,
                  onChange: onChange,
                  albumSelectionBuilder: nil,
                  cameraSelectionBuilder: nil,
                  cameraViewBuilder: nil,
                  customCameraGoToSettingsButton: customCameraGoToSettingsButton,
                  cameraCellTap: cameraCellTap)
    }
}

@available(iOS 17, *)
public extension MediaPicker where CameraSelectionContent == EmptyView, CameraViewContent == EmptyView {

    init(isPresented: Binding<Bool>,
         onChange: @escaping MediaPickerCompletionClosure,
         albumSelectionBuilder: @escaping AlbumSelectionClosure,
         cameraCellTap: (() -> ())? = nil,
         customCameraGoToSettingsButton: CustomCameraGoToSettingsButtonClosure? = nil) {

        self.init(isPresented: isPresented,
                  onChange: onChange,
                  albumSelectionBuilder: albumSelectionBuilder,
                  cameraSelectionBuilder: nil,
                  cameraViewBuilder: nil,
                  customCameraGoToSettingsButton: customCameraGoToSettingsButton,
                  cameraCellTap: cameraCellTap)
    }
}

@available(iOS 17, *)
public extension MediaPicker where AlbumSelectionContent == EmptyView {

    init(isPresented: Binding<Bool>,
         onChange: @escaping MediaPickerCompletionClosure,
         cameraSelectionBuilder: @escaping CameraSelectionClosure,
         cameraViewBuilder: @escaping CameraViewClosure,
         cameraCellTap: (() -> ())? = nil,
         customCameraGoToSettingsButton: CustomCameraGoToSettingsButtonClosure? = nil) {

        self.init(isPresented: isPresented,
                  onChange: onChange,
                  albumSelectionBuilder: nil,
                  cameraSelectionBuilder: cameraSelectionBuilder,
                  cameraViewBuilder: cameraViewBuilder,
                  customCameraGoToSettingsButton: customCameraGoToSettingsButton,
                  cameraCellTap: cameraCellTap)
    }
}

@available(iOS 17, *)
public extension MediaPicker where CustomCameraGoToSettingsContent == EmptyView {

    init(isPresented: Binding<Bool>,
         onChange: @escaping MediaPickerCompletionClosure,
         albumSelectionBuilder: AlbumSelectionClosure? = nil,
         cameraSelectionBuilder: CameraSelectionClosure? = nil,
         cameraViewBuilder: CameraViewClosure? = nil,
         cameraCellTap: (() -> ())? = nil) {

        self.init(isPresented: isPresented,
                  onChange: onChange,
                  albumSelectionBuilder: albumSelectionBuilder,
                  cameraSelectionBuilder: cameraSelectionBuilder,
                  cameraViewBuilder: cameraViewBuilder,
                  customCameraGoToSettingsButton: nil,
                  cameraCellTap: cameraCellTap)
    }
}
