//
//  ScreenshotCollectionViewCell.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 15/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import UIKit

class ScreenshotCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageScreenshot: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func registerScreenshotCell()->UINib{
        return UINib(nibName: "ScreenshotCollectionViewCell", bundle: nil)
    }
}
