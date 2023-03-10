//
//  AlbumPhotosViewModel.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import Foundation
import Core
import Domain
import RxSwift
import RxCocoa


class AlbumPhotosViewModel {
    
    ///private
    ///
    private let disposeBag = DisposeBag()
    
    ///inject
    ///
    private let album: Album
    
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
    
    private var navigationTitle = PublishSubject<String>()
    var navigationTitleObservable: Observable<String> {
        return navigationTitle
    }
    
    let albumPhotos = BehaviorRelay<[AlbumPhoto]>.init(value: [])
   
    
    ///init
    ///
    init(album: Album) {
        self.album = album
        self.fetchAlbumPhotos()
    }
}


//MARK: - AlbumPhotosViewModel input -
//
extension AlbumPhotosViewModel: AlbumPhotosViewModelInput {
    
}


//MARK: - AlbumPhotosViewModel output -
//
extension AlbumPhotosViewModel: AlbumPhotosViewModelOutput {
    
}


//MARK: - fetch albums -
//
extension AlbumPhotosViewModel {
    private func fetchAlbumPhotos() {
        indicatorStatus.onNext(true)
        
        ServiceLocator.homeRepository.albumPhotos(albumId: album.id) { [weak self] result in
            guard let self = self else { return }
            
            self.indicatorStatus.onNext(false)
            
            switch result {
            case .success(let list):
                self.albumPhotos.accept(list)
                self.navigationTitle.onNext(self.album.title)
                
            case .failure(let error):
                self.errorMessage.onNext(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
            }
        }
    }
}
