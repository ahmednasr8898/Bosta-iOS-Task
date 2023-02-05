//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import Foundation


public typealias Albums = [AlbumElement]

// MARK: - AlbumElement
public struct AlbumElement: Codable {
    public let userID, id: Int
    public let title: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}


