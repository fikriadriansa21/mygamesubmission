//
//  DetailGenreViewController.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 14/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import UIKit

class DetailGenreViewController: UIViewController {
    
    @IBOutlet weak var labelDescriptionGenre: UILabel!
    @IBOutlet weak var labelGameCount: UILabel!
    @IBOutlet weak var labelTitleGenre: UILabel!
    @IBOutlet weak var imageBackgroundGenre: UIImageView!
    
    var genreSelected: Genres?
    var genreDetail: GenreDetail?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDataDetailGenre()
    }
    
    @objc private func loadDataDetailGenre(){
        NetworkManager.getGenreDetail(id: (genreSelected?.id)!, completion: {genreDetail in
            if let genreDetail = genreDetail{
                DispatchQueue.main.async {
                    self.labelTitleGenre.text = genreDetail.name
                    self.labelGameCount.text = String(genreDetail.games_count)
                    self.setImage(from: genreDetail.image!)
                    self.labelDescriptionGenre.text = genreDetail.description
                }
            }
        })
    }
    

}

extension DetailGenreViewController{
    func setImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.imageBackgroundGenre.image = image
                }
            }
        }.resume()
    }
}
