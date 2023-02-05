//
//  AlbumPhotosViewController.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import UIKit
import Domain
import UIBostaStyle
import RxSwift
import RxCocoa


class AlbumPhotosViewController: UIViewController {

    //MARK: - outlets -
    //
    
    //MARK: - properties -
    //
    private let viewModel: AlbumPhotosViewModelType
    private let disposeBag = DisposeBag()
    weak var coordinator: HomeCoordinatorProtocol?
    
    //MARK: - init -
    //
    init(viewModel: AlbumPhotosViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - life cycle -
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToActivityIndicator()
        subscribeToErrorMessage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToNavigationTitle()
        setupNavigation()
    }
}


//MARK: - subscribe to navigation title -
//
extension AlbumPhotosViewController {
    private func subscribeToNavigationTitle() {
        viewModel.navigationTitleObservable.subscribe { [weak self] title in
            guard let self = self else { return }
            self.title = title
        }.disposed(by: disposeBag)
    }
}


//MARK: - subscribe to activity indicator status -
//
extension AlbumPhotosViewController {
    private func subscribeToActivityIndicator() {
        viewModel.indicatorStatusObservable.subscribe { [weak self] status in
            guard let self = self else { return }
            Indicator.createIndicator(on: self, status: status)
        }.disposed(by: disposeBag)
    }
}


//MARK: - subscribe to error message -
//
extension AlbumPhotosViewController {
    private func subscribeToErrorMessage() {
        viewModel.errorMessageObservable.subscribe { [weak self] message in
            guard let self = self else { return }
            Alert.defaultAlert(on: self, message: message)
        }.disposed(by: disposeBag)
    }
}

