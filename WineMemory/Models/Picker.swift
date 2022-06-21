//
//  Picker.swift
//  WineMemory
//
//  Created by Gerd Faedtke on 21.06.22.
//

import SwiftUI
import AVFoundation

enum Picker {
    enum Source: String {
        case library, camera
    }
    
    enum PickerError: Error, LocalizedError {
        case unavailable
        case restricted
        case denied
        
        var errorDescription: String? {
            switch self {
            case .unavailable:
                return NSLocalizedString("There is no camera available on this device", comment: "")
            case .restricted:
                return NSLocalizedString("You are not allowed to access media capture devices.", comment: "")
            case .denied:
                return NSLocalizedString("You have explicity denied permission for media capture. Please open permissions/Privacy/camera and grant access for this application", comment: "")
            }
        }
    }
    
    static func checkPermission()throws {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
                switch authStatus {
                case .denied:
                    throw PickerError.denied
                case .restricted:
                    throw PickerError.restricted
                default:
                    break
            }
            } else {
                throw PickerError.unavailable
            }
    }
    
    struct CameraErrorType {
        let error: Picker.PickerError
        var message: String {
            error.localizedDescription
        }
        let button = Button("OK", role: .cancel) {}
    }
    
}
