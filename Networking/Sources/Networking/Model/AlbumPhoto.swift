//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import Foundation


public typealias AlbumPhotos = [AlbumPhotoElement]

// MARK: - AlbumPhotoElement
public struct AlbumPhotoElement: Codable {
    public let albumID, id: Int
    public let title: String
    public let url, thumbnailURL: String
    
    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}


