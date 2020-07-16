//
//  GameCollectionViewCell.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 12/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionViewGame: UIView!
    @IBOutlet weak var labelMeta: UILabel!
    @IBOutlet weak var labelPlatform: UILabel!
    @IBOutlet weak var labelReleased: UILabel!
    @IBOutlet weak var labelGameTitle: UILabel!
    @IBOutlet weak var imageGame: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func registerGameCell()->UINib{
        return UINib(nibName: "GameCollectionViewCell", bundle: nil)
    }


}
