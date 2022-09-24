//
//  ImageLoadingViewModel.swift
//  DownloadAndSave
//
//  Created by Sajad Abedi on 24.09.2022.
//

import Foundation
import SwiftUI
import Combine

class ImageLoadingViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    var cancellables = Set<AnyCancellable>()
    let manager = PhotoModelCacheManager.instance
    
    let imageURL: String
    let imageKey: String
    
    init(url: String, key: String) {
        imageURL = url
        imageKey = key
        getImage()
    }
    
    func getImage() {
        if let savedImage = manager.get(key: imageKey) {
            image = savedImage
            print("getting saved image!")
        } else {
            downloadImage()
            print("download image!")
        }
    }
    
    func downloadImage() {
        isLoading = true
        guard let url = URL(string: imageURL) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let image = returnedImage else { return }
                self.image = returnedImage
                self.manager.add(key: self.imageKey, value: image)
            }
            .store(in: &cancellables)

    }
}
