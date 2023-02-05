//
//  HomeCoordinator.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import UIKit

protocol HomeCoordinatorProtocol: AnyObject {
    func showProfile()
}

class HomeCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
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
}
