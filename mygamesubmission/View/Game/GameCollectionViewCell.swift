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
        // Initialization code
        setupShapeCard()
    }
    
    private func setupShapeCard(){
        collectionViewGame.layer.cornerRadius = 20.0
        collectionViewGame.layer.shadowColor = UIColor.gray.cgColor
        collectionViewGame.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        collectionViewGame.layer.shadowRadius = 12.0
        collectionViewGame.layer.shadowOpacity = 0.7
    }
    
    static func registerGameCell()->UINib{
        return UINib(nibName: "GameCollectionViewCell", bundle: nil)
    }


}
