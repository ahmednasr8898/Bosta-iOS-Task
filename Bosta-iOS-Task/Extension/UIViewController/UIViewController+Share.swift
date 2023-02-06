//
//  UIViewController+Share.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 06/02/2023.
//

import UIKit


//MARK: - share -
//
extension UIViewController{
    func share(view: UIView, url: URL) {
        let shareSheet = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        shareSheet.popoverPresentationController?.sourceView = view
        shareSheet.popoverPresentationController?.sourceRect = view.frame
        present(shareSheet, animated: true)
    }
}
