//
//  DownloadingImagesViewModel.swift
//  DownloadAndSave
//
//  Created by Sajad Abedi on 24.09.2022.
//

import Foundation
import Combine

class DownloadingImagesViewModel: ObservableObject {
    
    let dataService = PhotoModelDtatService.instance
    
    @Published var data: [PhotoModel] = []
    var cancellables = Set<AnyCancellable>()
    
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$photoModel
            .sink { [weak self] (returnedPhotoModels) in
                self?.data = returnedPhotoModels
            }
            .store(in: &cancellables)
    }
}
