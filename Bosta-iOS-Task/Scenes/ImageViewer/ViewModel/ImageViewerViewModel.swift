//
//  
//  ImageViewerViewModel.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 06/02/2023.
//
//

import Foundation


class ImageViewerViewModel {
    ///inject
    ///
    private let imagePath: String
    
    ///init
    ///
    init(imagePath: String) {
        self.imagePath = imagePath
    }
}


//MARK: - ImageViewerViewModel input -
//
extension ImageViewerViewModel: ImageViewerViewModelInput {
    
}


//MARK: - ImageViewerViewModel output -
//
extension ImageViewerViewModel: ImageViewerViewModelOutput {
    func getImagePathUrl() -> URL? {
        let url = URL(string: imagePath)
        return url
    }
}

