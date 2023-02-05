//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import Foundation


///User model
///
public struct User {
    public let id: Int
    public let name: String
    public let address: String
    
    public init(id: Int, name: String, address: String) {
        self.id = id
        self.name = name
        self.address = address
    }
}
