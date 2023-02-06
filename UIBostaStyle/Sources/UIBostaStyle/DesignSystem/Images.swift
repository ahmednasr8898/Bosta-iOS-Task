//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 06/02/2023.
//

import UIKit

extension DesignSystem {
    public enum SystemImages: String {
        
        case search = "magnifyingglass"
       
        
        //return name of image
        public var name: String {
            return self.rawValue
        }
        
        //return image
        @available(iOS 13.0, *)
        public var image: UIImage {
            return UIImage(systemName: self.rawValue) ?? UIImage()
        }
    }
}
