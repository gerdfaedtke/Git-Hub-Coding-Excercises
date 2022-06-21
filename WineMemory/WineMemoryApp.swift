//
//  WineMemoryApp.swift
//  WineMemory
//
//  Created by Gerd Faedtke on 20.06.22.
//

import SwiftUI

@main
struct WineMemoryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
