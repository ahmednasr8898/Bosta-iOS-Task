//
//  ServiceLocator.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 28/02/2023.
//

import Foundation
import Domain
import Core


/// Provide access to application services. Why private properties? Unit-testing!
///
class ServiceLocator {
    
    
    /// Repository provider
    ///
    private static var _provider: RepositoryProvider = DefaultRepositoryProvider()
    static var provider: RepositoryProvider {
        return _provider
    }
    
    ///Home Repository
    private static var _homeRepository: Domain.HomeRepository = provider.makeHomeRepository()
    static var homeRepository: Domain.HomeRepository {
        return _homeRepository
    }
}
