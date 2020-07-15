//
//  GameDetail.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 14/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import Foundation

struct GameDetail: Codable {
    let id: Int
    let name: String
    let description: String
    let metacritic: Int
    let released: String
    let image: URL?
    let publishers: [Publishers]
    let platforms: [PlatformsGameDetail]
    let genres: [GenreGameDetail]
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case released = "released"
        case image = "background_image"
        case metacritic = "metacritic"
        case platforms = "platforms"
        case publishers = "publishers"
        case description = "description_raw"
        case genres = "genres"
    }
    
    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        released = try container.decode(String.self, forKey: .released)
        image = try container.decode(URL.self, forKey: .image)
        metacritic = try container.decode(Int.self, forKey: .metacritic)
        platforms = try container.decode([PlatformsGameDetail].self, forKey: .platforms)
        publishers = try container.decode([Publishers].self, forKey: .publishers)
        genres = try container.decode([GenreGameDetail].self, forKey: .genres)
        description = try container.decode(String.self, forKey: .description)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(released, forKey: .released)
        try container.encode(image, forKey: .image)
        try container.encode(metacritic, forKey: .metacritic)
        try container.encode(platforms, forKey: .platforms)
        try container.encode(genres, forKey: .genres)
    }
}

struct Publishers: Codable{
    let id: Int
    let name: String
    let image: URL
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case image = "image_background"
    }
    
    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        image = try container.decode(URL.self, forKey: .image)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(image, forKey: .image)
    }
}

struct PlatformsGameDetail: Codable{
    let platform: PlatformGameDetail
    
    enum CodingKeys: String, CodingKey {
        case platform = "platform"
    }
    
    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)

        platform = try container.decode(PlatformGameDetail.self, forKey: .platform)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(platform, forKey: .platform)
    }
}


struct PlatformGameDetail : Codable{
    let id: Int
    let name: String
    
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

struct GenreGameDetail : Codable{
    let id: Int
    let name: String
    
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

