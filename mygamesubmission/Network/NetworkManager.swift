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
    let detailGame = "/games/"
    
    
    static func getListGenre(page_size: String, completion: @escaping([Genres]?) -> Void){
        URLSession.shared.dataTask(with: URL(string: "\(baseURL)\(listGenre)\(page_size)")!, completionHandler: {(data,response,error)  in
            if let data = data{
                do {
                    let decoder = JSONDecoder()
                    let responseGenre = try decoder.decode(ResponseGenre.self, from: data)
                    completion(responseGenre.results)
                } catch  {
                    print("Error decode: \(error.localizedDescription)")
                }
                
            }else{
                print("Error : \(String(describing: error))")
            }
        }).resume()
    }
    
    static func getListGame(page_size: String, completion: @escaping([Games]?) -> Void){
        URLSession.shared.dataTask(with: URL(string: "\(baseURL)\(listGame)\(page_size)")!, completionHandler: {(data,response,error)  in
            if let data = data{
                do {
                    let decoder = JSONDecoder()
                    let responseGame = try decoder.decode(ResponseGame.self, from: data)
                    completion(responseGame.results)
                    print(responseGame.results)
                } catch  {
                    print("Error decode: \(error.localizedDescription)")
                }
                
            }else{
                print("Error : \(String(describing: error))")
            }
        }).resume()
    }
    
}
