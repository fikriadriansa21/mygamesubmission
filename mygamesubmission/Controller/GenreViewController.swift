//
//  GenreViewController.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 13/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import UIKit

class GenreViewController: UIViewController {
    
    @IBOutlet weak var genreCollectionView: UICollectionView!
    
    var genres = [Genres](){
        didSet {
             DispatchQueue.main.async {
                 self.genreCollectionView.reloadData()
             }
         }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
        genreCollectionView.register(GenreCollectionViewCell.registerGenreCollectionCell(), forCellWithReuseIdentifier: "GenreCell")
        
        loadData()
        
    }
    
    @objc private func loadData(){
           NetworkManager.getListGenre(completion: {(genres) in
               if let genres = genres{
                   self.genres = genres
               }
           })
           self.genreCollectionView.reloadData()
       }


}

extension GenreViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellGenre = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCell", for: indexPath) as! GenreCollectionViewCell
        
        let genreList = genres[indexPath.row]
        setImage(from: genreList.image!, forCell: cellGenre)
        cellGenre.labelGenreTitle.text = genreList.name
        
        Utils.setupShapeCard(view: cellGenre)
        
        return cellGenre
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailGenre = DetailGenreViewController(nibName: "DetailGenreViewController", bundle: nil)
        detailGenre.genreSelected = genres[indexPath.row]

        detailGenre.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailGenre, animated: true)
    }
    
}

extension GenreViewController{
    private func setImage(from url: URL, forCell cell: GenreCollectionViewCell) {
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    cell.imageGenre.image = image
                }
            }
        }.resume()
    }
}
