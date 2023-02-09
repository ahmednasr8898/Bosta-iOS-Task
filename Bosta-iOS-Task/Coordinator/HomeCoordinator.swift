//
//  HomeCoordinator.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import UIKit
import Domain


protocol HomeCoordinatorProtocol: AnyObject {
    func showProfile()
    func showAlbumPhotos(album: Album)
    func showImageViewer(imagePath: String)
}

class HomeCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
        navigationController.navigationBar.tintColor = .red
    }
    
    func start() {
        showProfile()
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func showProfile() {
        let viewModel = ProfileViewModel()
        let viewController = ProfileViewController(viewModel: viewModel)
        viewController.coordinator = self
        show(viewController: viewController)
    }
    
    func showAlbumPhotos(album: Album) {
        let viewModel = AlbumPhotosViewModel(album: album)
        let viewController = AlbumPhotosViewController(viewModel: viewModel)
        viewController.coordinator = self
        show(viewController: viewController)
    }
    
    func showImageViewer(imagePath: String) {
        let viewModel = ImageViewerViewModel(imagePath: imagePath)
        let viewController = ImageViewerViewController(viewModel: viewModel)
        show(viewController: viewController)
    }
}
