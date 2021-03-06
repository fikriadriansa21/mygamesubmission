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
        gameCollectionView.register(GameCollectionViewCell.registerGameCell(), forCellWithReuseIdentifier: "GameCell")
        
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
            let cellGames = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCollectionViewCell
            
            let gameList = games[indexPath.row]
            setImage(from: gameList.image!, forCell: cellGames)
            cellGames.labelGameTitle.text = gameList.name
            cellGames.labelReleased.text = gameList.released
            
            let countedPlatforms = gameList.platforms.count
            
            for numbers in 0...countedPlatforms-1 {
                let platforms = gameList.platforms[numbers]
                
                if numbers == countedPlatforms-1 {
                    platformName += String("\(platforms.platform.name)")
                }else{
                    platformName += String("\(platforms.platform.name), ")
                }
            }
            
            cellGames.labelPlatform.text = platformName
            let stringMeta = String(gameList.metacritic!)
            cellGames.labelMeta.text = stringMeta
        
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
    func setImage(from url: URL, forCell cell: GameCollectionViewCell) {
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    cell.imageGame.image = image
                }
            }
        }.resume()
    }
}
