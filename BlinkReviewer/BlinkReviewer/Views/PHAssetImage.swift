//
//  PHAssetImage.swift
//  BlinkReviewer
//
//  Created by Alex Chan on 09/06/2023.
//

import SwiftUI
import Photos

class PHAssetImage: NSObject, ObservableObject {

    var asset: PHAsset?
    var size: CGSize
    
    @Published var image = NSImage()
    @Published var isPhotoLibraryAuthorized = false

    init(_ asset: PHAsset?, size: CGSize) {
        self.asset = asset
        self.size = size
        
        super.init()
        
        if let thisAsset = asset {
            // This implementation is based on code in a Stack Overflow answer
            // by Francois Nadeau: https://stackoverflow.com/a/48755517/1558022
            
            let options = PHImageRequestOptions()
            
            // do I still need this?
            options.isSynchronous = false
            
            // If i don't set this value, then sometimes I get an error like
            // this in the `info` variable:
            //
            //      Error Domain=PHPhotosErrorDomain Code=3164 "(null)"
            //
            // This means that the asset is in the cloud, and by default Photos
            // isn't allowed to download assets here.  Apple's documentation
            // suggests adding this option as the fix.
            //
            // See https://developer.apple.com/documentation/photokit/phphotoserror/phphotoserrornetworkaccessrequired
            options.isNetworkAccessAllowed = true
            
            PHCachingImageManager()
                .requestImage(
                    for: thisAsset,
                    targetSize: size,
                    contentMode: .aspectFill,
                    options: options,
                    resultHandler: { (result, info) -> Void in
                        print("Calling resultHandler for \(thisAsset.localIdentifier)")
                        self.image = result!
                    }
                )
        }
    }
}