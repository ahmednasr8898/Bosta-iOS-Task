//
//  AlbumTableViewCell.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    //MARK: - outlets -
    //
    @IBOutlet weak var albumTitleLabel: UILabel!
    
    //MARK: - properties -
    //
    static let identifier = "AlbumTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "AlbumTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(title: String) {
        albumTitleLabel.text = title
    }
}
