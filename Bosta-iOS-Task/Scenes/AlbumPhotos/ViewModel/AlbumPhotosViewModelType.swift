//
//  AlbumPhotosViewModelType.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import Foundation
import Domain
import RxSwift
import RxCocoa


typealias AlbumPhotosViewModelType = AlbumPhotosViewModelInput & AlbumPhotosViewModelOutput


//MARK: - Updates -
//
protocol AlbumPhotosViewModelInput {
    
}


//MARK: - Actions -
//
protocol AlbumPhotosViewModelOutput {
    var indicatorStatusObservable: Observable<Bool> { get }
    var errorMessageObservable: Observable<String> { get }
    var navigationTitleObservable: Observable<String> { get }
    var albumPhotos: BehaviorRelay<[AlbumPhoto]> { get }
}
