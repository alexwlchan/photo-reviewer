//
//  BlinkApp.swift
//  BlinkApp
//
//  Created by Alex Chan on 08/06/2023.
//

import SwiftUI

@main
struct BlinkApp: App {
    @AppStorage("colorScheme") private var colorScheme: String = "dark"
        
    let photosLibrary = PhotosLibrary()
        
    var body: some Scene {
        // Note: this uses `Window` instead of the `WindowGroup` from the
        // standard SwiftUI template, so that SwiftUI knows this app only
        // ever needs a single window, and it doesn't need to offer
        // window/tab management.
        //
        // See https://www.optionalmap.com/posts/swiftui_single_window_app/
        Window("Blink", id: "main") {
            PhotoReviewer()
                .environmentObject(photosLibrary)
                .preferredColorScheme(preferredColorScheme())
        }
        
        Settings {
            SettingsView()
        }
    }
    
    private func preferredColorScheme() -> ColorScheme? {
        switch(colorScheme) {
            case "dark":
                return .dark
            case "light":
                return .light
            default:
                return nil
        }
    }

}
