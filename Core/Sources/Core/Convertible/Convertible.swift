//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import Foundation
import Networking
import Domain



//MARK: - convert network user model to domain user model -
//
extension Networking.UserElement {
    func toDomain() -> Domain.User {
        let address = address.street + address.suite + address.city + address.zipcode
        let model = Domain.User(id: id, name: name, address: address)
        return model
    }
}


//MARK: - convert network album model to domain album model -
//
extension Networking.AlbumElement {
    func toDomain() -> Domain.Album {
        let model = Album(id: id, title: title)
        return model
    }
}


//MARK: - convert network album photo model to domain album photo model -
//
extension Networking.AlbumPhotoElement {
    func toDomain() -> Domain.AlbumPhoto {
        let model = AlbumPhoto(id: id, title: title, url: url)
        return model
    }
}
