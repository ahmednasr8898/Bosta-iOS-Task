//
//  SplashScreenViewController.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import UIKit

class SplashScreenViewController: UIViewController {

    //MARK: - outlets -
    //
    @IBOutlet weak var splashTitleLabel: UILabel!
   
    //MARK: - properties -
    //
    weak var coordinator: SplashCoordinatorProtocol?
    
    //MARK: - life cycle -
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        animationSplash()
    }
}

//MARK: - animation
//
extension SplashScreenViewController {
    private func animationSplash() {
        splashTitleLabel.text = ""
        let title = SplashConstants.title
        var charIndex = 0.0
        
        for letter in title {
            
            Timer.scheduledTimer(withTimeInterval: 0.25 * charIndex, repeats: false) { [weak self] timer in
                guard let self = self else {return}
                self.splashTitleLabel.text?.append(letter)
            }
            charIndex += 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self = self else { return }
            self.coordinator?.presentHome()
        }
    }
}
