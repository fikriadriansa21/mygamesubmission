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
    
    override func viewWillAppear(_ animated: Bool) {
        ProfileModel.synchronize()
        labelName.text = ProfileModel.name
        labelEmail.text = ProfileModel.email
    }
    
    @IBAction func buttonEditProfileClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "moveToEdit", sender: self)
    }
    
}
