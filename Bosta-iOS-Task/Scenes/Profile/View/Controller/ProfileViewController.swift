//
//  
//  ProfileViewController.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 05/02/2023.
//
//

import UIKit


class ProfileViewController: UIViewController {
    
    //MARK: - outlets -
    //
    
    //MARK: - properties -
    //
    private let viewModel: ProfileViewModelType
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
