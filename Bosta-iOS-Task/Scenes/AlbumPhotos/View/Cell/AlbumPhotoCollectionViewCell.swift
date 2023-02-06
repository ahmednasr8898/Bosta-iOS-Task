//
//  AlbumPhotoCollectionViewCell.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import UIKit

class AlbumPhotoCollectionViewCell: UICollectionViewCell {

    //MARK: - outlets -
    //
    @IBOutlet weak var albumImageView: UIImageView!
    
    //MARK: - properties -
    //
    static let identifier = "AlbumPhotoCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "AlbumPhotoCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(imagePath: String) {
        let url = URL(string: imagePath)
        albumImageView.setImage(url: url)
    }
}
