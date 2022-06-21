//
//  MyWineBottleError.swift
//  WineMemory
//
//  Created by Gerd Faedtke on 21.06.22.
//

import SwiftUI


enum MyWineBottleError: Error, LocalizedError {
    case readError
    case decodingError
    case encodingError
    case saveError
    case saveImageError
    case readImageError
    
    var errorDescription: String? {
        switch self {
            
        case .readError:
            return NSLocalizedString("Could not load MyWineBottle.json, please reinstall the app.", comment: "")
        case .decodingError:
            return NSLocalizedString("There was a problem loading your list of MyWineBottles please create a new image to start over", comment: "")
        case .encodingError:
            return NSLocalizedString("Could not save your MyWineBottle data, please reinstall the app.", comment: "")
        case .saveError:
            return NSLocalizedString("Could not save MyWineBottle.json, please reinstall the app.", comment: "")
        case .saveImageError:
            return NSLocalizedString("Could not save the Image, please reinstall the app.", comment: "")
        case .readImageError:
            return NSLocalizedString("Could not load the Image, please reinstall the app.", comment: "")
        }
    }
    
    struct ErrorType: Identifiable {
        let id = UUID()
        let error: MyWineBottleError
        var message: String {
            error.localizedDescription
        }
        let button = Button("OK", role: .cancel) {}
    }
}
