//
//  ViewModel.swift
//  WineMemory
//
//  Created by Gerd Faedtke on 20.06.22.
//

// Creating a View Model based on Stewart Lynch YouTube Series "My Images 1 till 3"



import SwiftUI

// New class ViewModel conformed to the ObservableObject Protocoll
class ViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var showPicker = false
    @Published var source: Picker.Source = .library
    @Published var showCameraAlert = false
    @Published var cameraError: Picker.CameraErrorType?
    
    func showPhotoPicker() {
        do {
            if source == .camera {
                try Picker.checkPermission()
            }
            showPicker = true
        } catch {
            showCameraAlert = true
            cameraError = Picker.CameraErrorType(error: error as! Picker.PickerError)
        }
    }
}

