//
//  ProfileViewController.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 16/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utils.setupRoundedImage(view: imageProfile)
    }
}
