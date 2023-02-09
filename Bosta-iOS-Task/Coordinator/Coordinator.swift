//
//  Coordinator.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import UIKit


protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}

extension Coordinator {
    func show(viewController: UIViewController, animated: Bool = true) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    func present(coordinator: Coordinator, animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.present(coordinator.navigationController, animated: animated, completion: completion)
    }
    
    func dismiss(animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
}


 

