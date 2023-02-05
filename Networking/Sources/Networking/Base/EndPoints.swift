//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import Foundation


enum EndPoints: String {
    case baseURL = "https://jsonplaceholder.typicode.com"
    
    var url: URL {
        return URL(string: self.rawValue)!
    }
}
