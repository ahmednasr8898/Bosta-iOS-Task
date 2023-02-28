//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 28/02/2023.
//

import Foundation
import Domain

/// Provide default implementation for `RepositoryProvider`
///
public struct DefaultRepositoryProvider {
    public init() { }
}

// MARK: - DefaultRepositoryProvider

extension DefaultRepositoryProvider: RepositoryProvider {
    public func makeHomeRepository() -> Domain.HomeRepository {
        return HomeRepository()
    }
}
