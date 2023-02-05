//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import Foundation


public typealias Users = [UserElement]

// MARK: - UserElement
public struct UserElement: Codable {
    public let id: Int
    public let name, username, email: String
    public let address: Address
    public let phone, website: String
}

// MARK: - Address
public struct Address: Codable {
    public let street, suite, city, zipcode: String
}
