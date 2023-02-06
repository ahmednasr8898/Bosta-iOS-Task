//
//  
//  ImageViewerViewModelType.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 06/02/2023.
//
//

import Foundation


typealias ImageViewerViewModelType = ImageViewerViewModelInput & ImageViewerViewModelOutput


//MARK: - Updates -
//
protocol ImageViewerViewModelInput {
    
}


//MARK: - Actions -
//
protocol ImageViewerViewModelOutput {
    func getImagePathUrl() -> URL?
}
