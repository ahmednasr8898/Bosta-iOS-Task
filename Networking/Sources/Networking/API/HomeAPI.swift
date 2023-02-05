//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import Foundation


public protocol HomeAPIProtocol {
    func users(completion: @escaping (Result<Users?, NSError>) -> Void)
    func albums(userId: Int, completion: @escaping (Result<Albums?, NSError>) -> Void)
    func albumPhotos(albumId: Int, completion: @escaping (Result<AlbumPhotos?, NSError>) -> Void)
}

public class HomeAPI: BaseAPI<HomeTarget>, HomeAPIProtocol {
    public override init() {}
    
}

//MARK: - users -
//
extension HomeAPI {
    public func users(completion: @escaping (Result<Users?, NSError>) -> Void) {
        connectWithServer(target: .users) { result in
            completion(result)
        }
    }
}

//MARK: - Albums -
//
extension HomeAPI {
    public func albums(userId: Int, completion: @escaping (Result<Albums?, NSError>) -> Void) {
        connectWithServer(target: .albums(userId: userId)) { result in
            completion(result)
        }
    }
}

//MARK: - Album photos -
//
extension HomeAPI {
    public func albumPhotos(albumId: Int, completion: @escaping (Result<AlbumPhotos?, NSError>) -> Void) {
        connectWithServer(target: .albumPhotos(albumId: albumId)) { result in
            completion(result)
        }
    }
}
