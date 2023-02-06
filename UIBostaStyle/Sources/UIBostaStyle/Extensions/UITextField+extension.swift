//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 06/02/2023.
//

import UIKit


//MARK: - set right / left padding to text field -
//
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat = 8) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat = 8) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}



//MARK: - set icone in right text field -
//
extension UITextField {
    public func setIcon(_ image: UIImage, tintColor: UIColor = .gray, width: CGFloat = 20, height: CGFloat = 20) {
        let iconView = UIImageView(frame: CGRect(x: -20, y: 0, width: width, height: height))
        iconView.image = image
        iconView.tintColor = tintColor
        iconView.contentMode = .scaleAspectFill
        let iconContainerView: UIView = UIView(frame: CGRect(x: -20, y: 0, width: width, height: height))
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
    }
}
