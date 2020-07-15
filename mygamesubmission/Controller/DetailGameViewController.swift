//
//  DetailGameViewController.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 11/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import UIKit

class DetailGameViewController: UIViewController {
    
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelPlatforms: UILabel!
    @IBOutlet weak var labelGenre: UILabel!
    @IBOutlet weak var labelReleased: UILabel!
    @IBOutlet weak var labelTitleGame: UILabel!
    @IBOutlet weak var labelPublisher: UILabel!
    @IBOutlet weak var labelMetaCritics: UILabel!
    @IBOutlet weak var imageGamePoster: UIImageView!
    @IBOutlet weak var screenshotCell: UICollectionView!
    
    var gameSelected: Games?
    var gameDetail: GameDetail?
    var screenshotData = [Screenshot](){
        didSet {
             DispatchQueue.main.async {
                 self.screenshotCell.reloadData()
             }
         }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenshotCell.delegate = self
        screenshotCell.dataSource = self
        screenshotCell.register(ScreenshotCollectionViewCell.registerScreenshotCell(), forCellWithReuseIdentifier: "ScreenshotCell")
        
        loadData()
    }

    @objc private func loadData(){
        NetworkManager.getScreenshotData(id: gameSelected!.id!, completion: { (screenshot, error) in
            if let screenshot = screenshot{
                self.screenshotData = screenshot
            }
            
        })
        
        NetworkManager.getDetailGames(id: gameSelected!.id!, completion: {(gameDetail,error) in
            if let gameDetail = gameDetail{
                var namePlatform = ""
                
                let totalPlatforms = gameDetail.platforms.count
                
                for numbers in 0...totalPlatforms-1 {
                    let platforms = gameDetail.platforms[numbers]
                    
                    if numbers == totalPlatforms-1 {
                        namePlatform += String("\(platforms.platform.name)")
                    }else{
                        namePlatform += String("\(platforms.platform.name), ")
                    }
                }
                
                let publishers = gameDetail.publishers.map { (element) -> String in
                    return element.name
                }
                
                let genres = gameDetail.genres.map { (element) -> String in
                    return element.name
                }
                
                DispatchQueue.main.async {
                    self.labelTitleGame.text = gameDetail.name
                    self.labelPublisher.text = publishers.joined(separator: ", ")
                    let stringMeta = String(gameDetail.metacritic)
                    self.labelMetaCritics.text = stringMeta
                    self.labelReleased.text = gameDetail.released
                    self.labelDescription.text = gameDetail.description
                    self.labelPlatforms.text = namePlatform
                    self.labelGenre.text = genres.joined(separator: ", ")
                    self.setImageBackground(from: gameDetail.image!)
                }
            }else{
                print(error!)
            }
        })
    }

}

extension DetailGameViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        screenshotData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellScreenshot = collectionView.dequeueReusableCell(withReuseIdentifier: "ScreenshotCell", for: indexPath) as! ScreenshotCollectionViewCell
        
        let screenshotList = screenshotData[indexPath.row]
        setImageScreenshot(from: screenshotList.image!, forCell: cellScreenshot)
        
        return cellScreenshot
    }
    
    
}

extension DetailGameViewController{
    func setImageScreenshot(from url: URL, forCell cell: ScreenshotCollectionViewCell) {
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    cell.imageScreenshot.image = image
                }
            }
        }.resume()
    }
    
    func setImageBackground(from url: URL) {
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.imageGamePoster.image = image
                }
            }
        }.resume()
    }
}
