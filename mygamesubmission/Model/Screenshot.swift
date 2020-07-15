//
//  Screenshot.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 15/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import Foundation

struct ScreenshotResponse: Codable{
    let results: [Screenshot]
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)

        results = try container.decode([Screenshot].self, forKey: .results)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(results, forKey: .results)
    }
}


struct Screenshot : Codable{
    let id: Int
    let image: URL?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case image = "image"
    }
    
    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        image = try container.decode(URL.self, forKey: .image)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(image, forKey: .image)
    }
}
