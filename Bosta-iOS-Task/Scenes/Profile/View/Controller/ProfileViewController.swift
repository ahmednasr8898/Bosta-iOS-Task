//
//  
//  ProfileViewController.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 05/02/2023.
//
//

import UIKit
import Domain
import UIBostaStyle
import RxSwift
import RxCocoa


class ProfileViewController: UIViewController {
    
    //MARK: - outlets -
    //
    @IBOutlet weak var userTitleLabel: UILabel!
    @IBOutlet weak var userAddressLabel: UILabel!
    @IBOutlet weak var albumsTableView: UITableView!
    
    //MARK: - properties -
    //
    private let viewModel: ProfileViewModelType
    private let disposeBag = DisposeBag()
    weak var coordinator: HomeCoordinatorProtocol?
    
    //MARK: - init -
    //
    init(viewModel: ProfileViewModelType) {
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
        subscribeToUserName()
        subscribeToUserAddress()
        setupTableView()
        subscribeToTableView()
        subscribeToSelectedItemInTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationTitle()
        setupNavigation()
    }
}


//MARK: - set navigation title -
//
extension ProfileViewController {
    private func setNavigationTitle() {
        title = ProfileConstants.navigationTitle
    }
}


//MARK: - subscribe to activity indicator status -
//
extension ProfileViewController {
    private func subscribeToActivityIndicator() {
        viewModel.indicatorStatusObservable.subscribe { [weak self] status in
            guard let self = self else { return }
            Indicator.createIndicator(on: self, status: status)
        }.disposed(by: disposeBag)
    }
}


//MARK: - subscribe to error message -
//
extension ProfileViewController {
    private func subscribeToErrorMessage() {
        viewModel.errorMessageObservable.subscribe { [weak self] message in
            guard let self = self else { return }
            Alert.defaultAlert(on: self, message: message)
        }.disposed(by: disposeBag)
    }
}


//MARK: - subscribe to user name -
//
extension ProfileViewController {
    private func subscribeToUserName() {
        viewModel.userNameObservable.subscribe { [weak self] name in
            guard let self = self else { return }
            self.userTitleLabel.text = name
        }.disposed(by: disposeBag)
    }
}


//MARK: - subscribe to user address -
//
extension ProfileViewController {
    private func subscribeToUserAddress() {
        viewModel.userAddressObservable.subscribe { [weak self] address in
            guard let self = self else { return }
            self.userAddressLabel.text = address
        }.disposed(by: disposeBag)
    }
}


//MARK: - set up table view
//
extension ProfileViewController {
    private func setupTableView() {
        albumsTableView.register(AlbumTableViewCell.nib(), forCellReuseIdentifier: AlbumTableViewCell.identifier)
        albumsTableView.rx.rowHeight.onNext(ProfileConstants.cellHeight)
    }
}


//MARK: - subscribe to table view
//
extension ProfileViewController {
    private func subscribeToTableView() {
        viewModel.albumsObservable.bind(to: albumsTableView.rx.items(cellIdentifier: AlbumTableViewCell.identifier, cellType: AlbumTableViewCell.self)) { row, item, cell in
            
            cell.configureCell(title: item.title)
            
        }.disposed(by: disposeBag)
    }
}


//MARK: - subscribe to selected item in table view
//
extension ProfileViewController {
    private func subscribeToSelectedItemInTableView() {
        Observable.zip(albumsTableView.rx.itemSelected, albumsTableView.rx.modelSelected(Album.self)).bind { _, albumModel in
            
            self.coordinator?.showAlbumPhotos(album: albumModel)
            
        }.disposed(by: disposeBag)
    }
}
