//
//  UIIMageView+kingfisher.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 06/02/2023.
//

import UIKit
import Kingfisher


protocol imageDownloaded {
    func setImage(url: URL?, placeholder: UIImage?)
}

//MARK: - set image with kingfisher -
//
extension UIImageView: imageDownloaded {
    func setImage(url: URL?, placeholder: UIImage? = nil) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url, placeholder: placeholder)
    }
}
