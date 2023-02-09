//
//  SplashCoordinator.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import UIKit


protocol SplashCoordinatorProtocol: AnyObject {
    func showSplashScreen()
    func presentHome()
}

class SplashCoordinator: Coordinator {
    let navigationController: UINavigationController
    private let presentHomeClosure: (()->())?
    
    init(presentHomeClosure: @escaping () -> Void) {
        self.navigationController = UINavigationController()
        self.presentHomeClosure = presentHomeClosure
    }
    
    func start() {
        showSplashScreen()
    }
}

extension SplashCoordinator: SplashCoordinatorProtocol {
    func showSplashScreen() {
        let splashScreenController = SplashScreenViewController()
        splashScreenController.coordinator = self
        show(viewController: splashScreenController)
    }
    
    func presentHome() {
        presentHomeClosure?()
    }
}
