//
//  EditProfileViewController.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 27/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var textfieldName: UITextField!
    @IBOutlet weak var textfieldEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func saveProfile(_ sender: Any) {
        if let name = textfieldName.text, let email = textfieldEmail.text {
            if name.isEmpty {
                textEmpty("Name")
            } else if email.isEmpty {
                textEmpty("Email")
            } else {
                saveDataProfile(name, email)
                
                self.dismiss(animated: true)
                print("\(name)")
                print(email)
            }
        }
    }
    @IBAction func cancelEditProfile(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ProfileModel.synchronize()
        textfieldName.text = ProfileModel.name
        textfieldEmail.text = ProfileModel.email
    }
    
    func saveDataProfile(_ name: String, _ email: String) {
       ProfileModel.name = name
       ProfileModel.email = email
    }
       
    func textEmpty(_ field: String){
       let alert = UIAlertController(title: "Alert", message: "\(field) is empty", preferredStyle: UIAlertController.Style.alert)
       alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
       self.present(alert, animated: true, completion: nil)
    }
}
