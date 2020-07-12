//
//  GameViewController.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 11/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var gameCollectionView: UICollectionView!
    @IBOutlet weak var genreCollectionView: UICollectionView!
    
    var genres = [Genres](){
        didSet {
             DispatchQueue.main.async {
                 self.genreCollectionView.reloadData()
             }
         }
    }
    
    var games = [Games](){
        didSet {
             DispatchQueue.main.async {
                 self.gameCollectionView.reloadData()
             }
         }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
        genreCollectionView.register(GenreCollectionViewCell.registerGenreCollectionCell(), forCellWithReuseIdentifier: "GenreCell")
        
        gameCollectionView.delegate = self
        gameCollectionView.dataSource = self
        gameCollectionView.register(GameCollectionViewCell.registerGameCell(), forCellWithReuseIdentifier: "GameCell")
        
        loadData()
        
    }
    
    @objc private func loadData(){
        NetworkManager.getListGenre(page_size: "10", completion: {(genres) in
            if let genres = genres{
                self.genres = genres
            }
        })
        
        NetworkManager.getListGame(page_size: "10", completion: {(games) in
            if let games = games{
                self.games = games
            }
        })
        
        self.genreCollectionView.reloadData()
        self.gameCollectionView.reloadData()
    }


}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.genreCollectionView {
            return genres.count
        }else{
            return games.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.genreCollectionView {
            let cellGenre = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCell", for: indexPath) as! GenreCollectionViewCell
            
            let genreList = genres[indexPath.row]
            loadImageCellGenre(genres: genreList, forCell: cellGenre)
            cellGenre.labelGenreTitle.text = genreList.name
            
            return cellGenre
        }else {
            let cellGames = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCollectionViewCell
            
            var namePlatform = ""
            
            let gameList = games[indexPath.row]
            loadImageCellGames(games: gameList, forCell: cellGames)
            cellGames.labelGameTitle.text = gameList.name
            cellGames.labelReleased.text = gameList.released
            
            let totalPlatforms = gameList.platforms?.count
            
            for numbers in 0...totalPlatforms!-1 {
                let platforms = gameList.platforms![numbers]
                
                if numbers == totalPlatforms!-1 {
                    namePlatform += String("\(platforms.platform.name)")
                }else{
                    namePlatform += String("\(platforms.platform.name), ")
                }
            }
            
            cellGames.labelPlatform.text = namePlatform
            let stringMeta = String(format:"%.1f", gameList.metacritic!)
            cellGames.labelMeta.text = stringMeta
            
            return cellGames
        }
        
    }
    
    func loadImageCellGenre(genres: Genres, forCell cell: GenreCollectionViewCell){
        DispatchQueue.main.async {
            do{
                let imageData = try Data.init(contentsOf: genres.image!)
                DispatchQueue.main.async {
                    cell.imageGenre.image = UIImage.init(data: imageData)
                }
            }catch{
                print("Memproses gambar bermasalah : \(error.localizedDescription)")
            }
        }
    }
    
    func loadImageCellGames(games: Games, forCell cell: GameCollectionViewCell){
        DispatchQueue.main.async {
            do{
                let imageData = try Data.init(contentsOf: games.image!)
                DispatchQueue.main.async {
                    cell.imageGame.image = UIImage.init(data: imageData)
                }
            }catch{
                print("Memproses gambar bermasalah : \(error.localizedDescription)")
            }
        }
    }
}
