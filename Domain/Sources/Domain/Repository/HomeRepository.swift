//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import Foundation


/// home repository use cases
///
public protocol HomeRepository {
    
    /// fetch random user
    ///
    func randomUser(completion: @escaping (Result<User, NSError>) -> Void)
    
    /// fetch album with user id
    ///
    func albums(userId: Int, completion: @escaping (Result<[Album], NSError>) -> Void)
    
    /// fetch album photos with album id
    ///
    func albumPhotos(albumId: Int, completion: @escaping (Result<[AlbumPhoto], NSError>) -> Void)
}
