import SwiftUI
import Photos

/// Show some debug information; the asset identifier.
struct Debug: View {
    var asset: PHAsset
    var focusedAssetIndex: Int
    
    var body: some View {
        Text("\(asset.localIdentifier) / asset \(focusedAssetIndex)")
            .font(.title)
            .padding(10)
            .foregroundColor(.white)
            .background(.black.opacity(0.7))
            .cornerRadius(7.0)
            .shadow(radius: 2.0)
            .textSelection(.enabled)
    }
}
