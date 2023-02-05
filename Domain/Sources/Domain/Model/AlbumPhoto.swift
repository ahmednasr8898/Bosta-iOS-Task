//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import Foundation


///AlbumPhoto model
///
public struct AlbumPhoto {
    public let id: Int
    public let title: String
    public let url: String
    
    public init(id: Int, title: String, url: String) {
        self.id = id
        self.title = title
        self.url = url
    }
}
