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
    
    var games = [Games](){
        didSet {
             DispatchQueue.main.async {
                 self.gameCollectionView.reloadData()
             }
         }
    }
    var platformName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameCollectionView.delegate = self
        gameCollectionView.dataSource = self
        gameCollectionView.register(MainGameCollectionViewCell.registerMainGameCell(), forCellWithReuseIdentifier: "MainGameCardCell")
        
        loadData()
    }
    
    @objc private func loadData(){
        NetworkManager.getListGame(completion: {(games) in
            if let games = games{
                self.games = games
            }
        })
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cellGames = collectionView.dequeueReusableCell(withReuseIdentifier: "MainGameCardCell", for: indexPath) as! MainGameCollectionViewCell
            
            let gameList = games[indexPath.row]
            setImage(from: gameList.image!, forCell: cellGames)
            cellGames.labelTitleGame.text = gameList.name
            cellGames.labelReleasedGame.text = gameList.released
            
            let countedPlatforms = gameList.platforms.count
            
            for numbers in 0...countedPlatforms-1 {
                let platforms = gameList.platforms[numbers]
                
                if numbers == countedPlatforms-1 {
                    platformName += String("\(platforms.platform.name)")
                }else{
                    platformName += String("\(platforms.platform.name), ")
                }
            }
            
            cellGames.labelPlatformGame.text = platformName
            let stringMeta = String(gameList.metacritic!)
            cellGames.labelMetaGame.text = stringMeta
        
            Utils.setupShapeCard(view: cellGames)
            
            return cellGames
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailGame = DetailGameViewController(nibName: "DetailGameViewController", bundle: nil)
        detailGame.gameSelected = games[indexPath.row]
        
        detailGame.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailGame, animated: true)
    }
    
}



extension HomeViewController{
    func setImage(from url: URL, forCell cell: MainGameCollectionViewCell) {
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    cell.imagePosterGame.image = image
                }
            }
        }.resume()
    }
}
