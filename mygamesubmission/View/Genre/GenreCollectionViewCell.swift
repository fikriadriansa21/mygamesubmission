//
//  GenreCollectionViewCell.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 11/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageGenre: UIImageView!
    @IBOutlet weak var labelGenreTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    static func registerGenreCollectionCell()->UINib{
        return UINib(nibName: "GenreCollectionViewCell", bundle: nil)
    }

}
