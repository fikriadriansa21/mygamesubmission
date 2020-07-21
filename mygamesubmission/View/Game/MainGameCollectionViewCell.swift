//
//  MainGameCollectionViewCell.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 21/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import UIKit

class MainGameCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelTitleGame: UILabel!
    @IBOutlet weak var imagePosterGame: UIImageView!
    @IBOutlet weak var labelReleasedGame: UILabel!
    @IBOutlet weak var labelPlatformGame: UILabel!
    @IBOutlet weak var labelMetaGame: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func registerMainGameCell()->UINib{
        return UINib(nibName: "MainGameCollectionViewCell", bundle: nil)
    }
}
