//
//  DetailGenreViewController.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 14/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import UIKit

class DetailGenreViewController: UIViewController {
    
    var genreSelected: Genres?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.tabBarController?.tabBar.isHidden = true
//        self.hidesBottomBarWhenPushed = true
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
