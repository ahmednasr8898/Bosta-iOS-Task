//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 07/02/2023.
//

import Foundation


/// Any model to be converted to domain should conform to the same protocol
///
protocol DomainConvertible {
    associatedtype DomainType

    /// Used to convert any model to a corresponding domain model
    ///
    func toDomain() -> DomainType
}
