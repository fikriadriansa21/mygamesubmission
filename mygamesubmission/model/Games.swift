//
//  Games.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 08/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//


import Foundation

struct GameResult: Codable{
    var results : [Games]
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)

        results = try container.decode([Games].self, forKey: .results)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(results, forKey: .results)
    }
    
}

struct Games: Codable {
    let id: Int?
    let name: String?
    let released: String?
    let image: String?
    let rating: Double?
    let metacritic: Int?
    let platforms: [Platforms]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case released = "released"
        case image = "background_image"
        case rating = "rating"
        case metacritic = "metacritic"
        case platforms = "platforms"
    }
    
    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        released = try container.decode(String.self, forKey: .released)
        image = try container.decode(String.self, forKey: .image)
        rating = try container.decode(Double.self, forKey: .rating)
        metacritic = try container.decode(Int.self, forKey: .metacritic)
        platforms = try container.decode([Platforms].self, forKey: .platforms)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(released, forKey: .released)
        try container.encode(image, forKey: .image)
        try container.encode(rating, forKey: .rating)
        try container.encode(metacritic, forKey: .metacritic)
        try container.encode(platforms, forKey: .platforms)
    }
    
}


struct Platforms: Codable{
    let platform: [Platform]?
    
    enum CodingKeys: String, CodingKey {
        case platform = "platform"
    }
    
    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)

        platform = try container.decode([Platform].self, forKey: .platform)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(platform, forKey: .platform)
    }
}


struct Platform : Codable{
    let id: Int?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
    }
}
