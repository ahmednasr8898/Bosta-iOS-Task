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
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var albumPhotosCollectionView: UICollectionView!
    
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
        setupCollectionView()
        bindToCollectionView()
        sizeOfCollectionViewCell()
        didSelectedItemInCollectionView()
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


//MARK: - set up collection view -
//
extension AlbumPhotosViewController {
    private func setupCollectionView() {
        albumPhotosCollectionView.register(AlbumPhotoCollectionViewCell.nib(), forCellWithReuseIdentifier: AlbumPhotoCollectionViewCell.identifier)
        albumPhotosCollectionView.keyboardDismissMode = .onDrag
    }
}


//MARK: - bind to collection view -
//
extension AlbumPhotosViewController {
    private func bindToCollectionView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let _ = self.searchTextField.rx.text.orEmpty
                .throttle(.microseconds(300), scheduler: MainScheduler.instance)
                .distinctUntilChanged()
                .map({ [unowned self] text in
                    
                    self.viewModel.albumPhotos.value.filter({ item in
                        
                        text.isEmpty || item.title.lowercased().contains(text.lowercased())
                    })
                    
                }).bind(to: self.albumPhotosCollectionView.rx.items(cellIdentifier: AlbumPhotoCollectionViewCell.identifier, cellType: AlbumPhotoCollectionViewCell.self)) { row, item, cell in
                    
                    cell.configureCell(imagePath: item.url)
                    
                }.disposed(by: self.disposeBag)
        }
    }
}


//MARK: - size of collection view -
//
extension AlbumPhotosViewController {
    private func sizeOfCollectionViewCell() {
        let flowLayout = UICollectionViewFlowLayout()
        let size = (albumPhotosCollectionView.frame.size.width - CGFloat(30)) / CGFloat(3)
        flowLayout.itemSize = CGSize(width: size, height: size)
        albumPhotosCollectionView.setCollectionViewLayout(flowLayout, animated: true)
    }
}


//MARK: - did selected item in collection view -
//
extension AlbumPhotosViewController {
    private func didSelectedItemInCollectionView() {
        Observable.zip(albumPhotosCollectionView.rx.itemSelected, albumPhotosCollectionView.rx.modelSelected(AlbumPhoto.self)).bind { [weak self] _, albumPhotoModel in
            guard let self = self else { return }
            
            self.view.endEditing(true)
            self.coordinator?.showImageViewer(imagePath: albumPhotoModel.url)

        }.disposed(by: disposeBag)
    }
}
