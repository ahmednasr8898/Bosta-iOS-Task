//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import Foundation
import Networking
import Domain

public struct HomeRepository: Domain.HomeRepository {
    private let api: HomeAPIProtocol
    
    public init(api: HomeAPIProtocol) {
        self.api = api
    }
}

//MARK: - fetch random user -
//
extension HomeRepository {
    public func randomUser(completion: @escaping (Result<Domain.User, NSError>) -> Void) {
        api.users { result in
            
            switch result {
                
            case .success(let response):
                
                guard let response = response else { return }
                guard let item = response.randomElement() else { return }
                completion(.success(item.toDomain()))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


//MARK: - fetch albums -
//
extension HomeRepository {
    public func albums(userId: Int, completion: @escaping (Result<[Domain.Album], NSError>) -> Void) {
        api.albums(userId: userId) { result in
            
            switch result {
            case .success(let response):
                guard let response = response else { return }
                let domainList = response.map { $0.toDomain() }
                completion(.success(domainList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


//MARK: - fetch album photos -
//
extension HomeRepository {
    public func albumPhotos(albumId: Int, completion: @escaping (Result<[Domain.AlbumPhoto], NSError>) -> Void) {
        api.albumPhotos(albumId: albumId) { result in
            switch result {
            case .success(let response):
                guard let response = response else { return }
                let domainList = response.map { $0.toDomain() }
                completion(.success(domainList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
