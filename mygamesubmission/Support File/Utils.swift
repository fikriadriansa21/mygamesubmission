//
//  Utils.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 14/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import Foundation
import UIKit

class Utils{
    static func setupShapeCard(view: UIView!){
        view.layer.cornerRadius = 10.0
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view.layer.shadowRadius = 12.0
        view.layer.shadowOpacity = 0.7
    }
    
    static func setupRoundedImage(view: UIView!){
        view.layer.cornerRadius = view.frame.width/2
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
    }
}

//extension LosslessStringConvertible {
//    var string: String { .init(self) }
//}
