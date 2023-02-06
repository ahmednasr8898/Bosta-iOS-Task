//
//  UIViewController+Navigation.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import UIKit


//MARK: - set up navigation controller -
//
extension UIViewController {
    func setupNavigation(prefersLargeTitles: Bool = true) {
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitles
    }
}
