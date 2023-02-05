//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import UIKit

@available(iOS 13.0, *)
public struct Indicator {
    
    static let indicator = UIActivityIndicatorView(style: .large)
    @available(iOS 13.0, *)
    
    public static func createIndicator(on vc: UIViewController, status: Bool) {
        indicator.center = vc.view.center
        indicator.color = .red
        vc.view.addSubview(indicator)
        switch status {
        case true :
            indicator.startAnimating()
        case false:
            indicator.stopAnimating()
        }
    }
}

