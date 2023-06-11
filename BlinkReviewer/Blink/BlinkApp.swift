//
//  BlinkApp.swift
//  BlinkApp
//
//  Created by Alex Chan on 08/06/2023.
//

import SwiftUI

@main
struct BlinkApp: App {
    let photosLibrary = PhotosLibrary()
    
    var body: some Scene {
        WindowGroup {
            PhotoReviewer().environmentObject(photosLibrary)
        }
    }
}