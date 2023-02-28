//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 28/02/2023.
//

import Foundation


/// Should create new instances of Repositories
///
public protocol RepositoryProvider {

    /// Creates new instance of `HomeRepository`
    ///
    func makeHomeRepository() -> HomeRepository
}
