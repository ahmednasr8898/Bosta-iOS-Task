//
//  
//  ProfileViewModelType.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 05/02/2023.
//
//

import Foundation
import Domain
import RxSwift
import RxCocoa


typealias ProfileViewModelType = ProfileViewModelInput & ProfileViewModelOutput


//MARK: - Updates -
//
protocol ProfileViewModelInput {
    
}


//MARK: - Actions -
//
protocol ProfileViewModelOutput {
    var indicatorStatusObservable: Observable<Bool> { get }
    var errorMessageObservable: Observable<String> { get }
    var userNameObservable: Observable<String> { get }
    var userAddressObservable: Observable<String> { get }
    var albumsObservable: Observable<[Album]> { get }
}
