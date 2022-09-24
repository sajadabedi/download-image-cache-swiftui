//
//  PhotoModel.swift
//  DownloadAndSave
//
//  Created by Sajad Abedi on 24.09.2022.
//

import Foundation

struct PhotoModel: Identifiable, Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
