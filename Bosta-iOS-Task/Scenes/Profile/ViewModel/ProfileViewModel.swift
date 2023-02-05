//
//  
//  ProfileViewModel.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 05/02/2023.
//
//

import Foundation
import Core
import Domain
import RxSwift
import RxCocoa


class ProfileViewModel {
    ///core repository
    ///
    private let repository = HomeRepository()
    
    ///outputs
    ///
    private var indicatorStatus = PublishSubject<Bool>()
    var indicatorStatusObservable: Observable<Bool> {
        return indicatorStatus
    }
    
    private var errorMessage = PublishSubject<String>()
    var errorMessageObservable: Observable<String> {
        return errorMessage
    }
    
    private var userName = PublishSubject<String>()
    var userNameObservable: Observable<String> {
        return userName
    }
    
    private var userAddress = PublishSubject<String>()
    var userAddressObservable: Observable<String> {
        return userAddress
    }
    
    private var albums = PublishSubject<[Album]>()
    var albumsObservable: Observable<[Album]> {
        return albums
    }
    
    ///init
    ///
    init() {
        fetchUser()
    }
}


//MARK: - ProfileViewModel input -
//
extension ProfileViewModel: ProfileViewModelInput {
    
}


//MARK: - ProfileViewModel output -
//
extension ProfileViewModel: ProfileViewModelOutput {
    
}
   
//MARK: - fetch user -
//
extension ProfileViewModel {
    private func fetchUser() {
        indicatorStatus.onNext(true)
        repository.randomUser { [weak self] result in
            guard let self = self else { return }
            
            self.indicatorStatus.onNext(false)
            
            switch result {
            case .success(let user):
                self.userName.onNext(user.name)
                self.userAddress.onNext(user.address)
                self.fetchAlbums(userId: user.id)
            case .failure(let error):
                self.errorMessage.onNext(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
            }
        }
    }
}

//MARK: - fetch albums -
//
extension ProfileViewModel {
    private func fetchAlbums(userId: Int) {
        indicatorStatus.onNext(true)
        repository.albums(userId: userId) { [weak self] result in
            guard let self = self else { return }
            
            self.indicatorStatus.onNext(false)
            
            switch result {
            case .success(let list):
                guard !list.isEmpty else { return }
                self.albums.onNext(list)
            case .failure(let error):
                self.errorMessage.onNext(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
            }
        }
    }
}
