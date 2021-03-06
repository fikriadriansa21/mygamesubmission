//
//  NetworkManager.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 12/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import Foundation

class NetworkManager{
    static let baseURL = "https://api.rawg.io/api"
    static let listGame = "/games?page_size="
    static let listGenre = "/genres?page_size="
    static let game = "/games/"
    static let screenshot = "/screenshots"
    static let genre = "/genres/"
    
    
    static func getListGenre(completion: @escaping([Genres]?) -> Void){
        URLSession.shared.dataTask(with: URL(string: "\(baseURL)\(listGenre)")!, completionHandler: {(data,response,error)  in
            if let data = data{
                do {
                    let decoder = JSONDecoder()
                    let responseGenre = try decoder.decode(ResponseGenre.self, from: data)
                    completion(responseGenre.results)
                } catch  {
                    print("Decode proccess error:  \(error.localizedDescription)")
                }
                
            }else{
                print("Error : \(String(describing: error))")
            }
        }).resume()
    }
    
    static func getGenreDetail(id: Int, completion: @escaping(GenreDetail?) -> Void){
        URLSession.shared.dataTask(with: URL(string: "\(baseURL)\(genre)\(id)")!, completionHandler: {(data,response,error)  in
            if let data = data{
                do {
                    let decoder = JSONDecoder()
                    let responseGenreDetail = try decoder.decode(GenreDetail.self, from: data)
                    completion(responseGenreDetail)
                } catch  {
                    print("Decode proccess error:  \(error.localizedDescription)")
                }
                
            }else{
                print("Error : \(String(describing: error))")
            }
        }).resume()
    }
    
    static func getListGame(completion: @escaping([Games]?) -> Void){
        URLSession.shared.dataTask(with: URL(string: "\(baseURL)\(listGame)")!, completionHandler: {(data,response,error)  in
            if let data = data{
                do {
                    let decoder = JSONDecoder()
                    let responseGame = try decoder.decode(ResponseGame.self, from: data)
                    completion(responseGame.results)
                } catch  {
                    print("Decode proccess error: \(error.localizedDescription)")
                }
                
            }else{
                print("Error : \(String(describing: error))")
            }
        }).resume()
    }
    
    
    static func getDetailGames(id: Int, completion: @escaping(GameDetail?, Error?) -> Void){
        URLSession.shared.dataTask(with: URL(string: "\(baseURL)\(game)\(id)")!, completionHandler: {(data,response,error)  in
            if let data = data{
                do {
                    let decoder = JSONDecoder()
                    let responseGame = try decoder.decode(GameDetail.self, from: data)
                    completion(responseGame,nil)
                } catch  {
                    print("Error decode: \(error.localizedDescription)")
                }
                
            }else{
                completion(nil, error)
            }
        }).resume()
    }
    
    static func getScreenshotData(id: Int, completion: @escaping([Screenshot]?, Error?) -> Void){
        URLSession.shared.dataTask(with: URL(string: "\(baseURL)\(game)\(id)\(screenshot)")!, completionHandler: {(data,response,error)  in
            if let data = data{
                do {
                    let decoder = JSONDecoder()
                    let responseData = try decoder.decode(ScreenshotResponse.self, from: data)
                    completion(responseData.results,nil)
                } catch  {
                    print("Error decode: \(error.localizedDescription)")
                }
                
            }else{
                completion(nil, error)
            }
        }).resume()
    }
    
    
    
    
}
