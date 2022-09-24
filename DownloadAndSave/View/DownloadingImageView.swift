//
//  DownloadingImageView.swift
//  DownloadAndSave
//
//  Created by Sajad Abedi on 24.09.2022.
//

import SwiftUI

struct DownloadingImageView: View {
    
    @StateObject var loader: ImageLoadingViewModel
    init(url: String) {
        _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url))
    }
    
    var body: some View {
        if loader.isLoading {
            ProgressView()
        } else if let image = loader.image {
            Image(uiImage: image)
                .resizable()
                .clipShape(Circle())
        }
    }
}

struct DownloadingImageVIew_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImageView(url: "https://via.placeholder.com/600/92c952")
            .frame(width: 75, height: 75)
            .previewLayout(.sizeThatFits)
    }
}
