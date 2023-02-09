//
//  AppCoordinator.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import UIKit


class AppCoordinator: Coordinator {
    let navigationController: UINavigationController
    let window: UIWindow
    private var children: [Coordinator] = []
    
    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        presentSplashScreenCoordinator()
    }
}

extension AppCoordinator {
    private func presentHomeCoordinator() {
        let homeCoordinator = HomeCoordinator()
        children.removeAll()
        startCoordinator(homeCoordinator)
        replaceWindowRootViewController(homeCoordinator.navigationController)
    }
    
    private func presentSplashScreenCoordinator() {
        let splashCoordinator = SplashCoordinator { [weak self] in
            self?.presentHomeCoordinator()
        }
        children.removeAll()
        startCoordinator(splashCoordinator)
        replaceWindowRootViewController(splashCoordinator.navigationController)
    }
}

//MARK: start coordinator
//
private extension AppCoordinator {
    private func startCoordinator(_ coordinator: Coordinator) {
        children = [coordinator]
        coordinator.start()
    }
}

// MARK: replace root view controller Window
//
private extension AppCoordinator {
    func replaceWindowRootViewController(_ viewController: UIViewController) {
        UIView.transition(with: window, duration: 0.3, options: [.transitionCrossDissolve], animations: {
            self.window.rootViewController = viewController
            self.window.makeKeyAndVisible()
        }, completion: { _ in
            // maybe do something on completion here
        })
    }
}
