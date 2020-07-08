//
//  Games.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 08/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let games = try? newJSONDecoder().decode(Games.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.gamesTask(with: url) { games, response, error in
//     if let games = games {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Games
struct Games: Codable {
    let id: Int
    let slug, name, released: String
    let tba: Bool
    let backgroundImage: String
    let rating: Double
    let ratingTop: Int
    let ratings: [Rating]
    let ratingsCount, reviewsTextCount, added: Int
    let addedByStatus: AddedByStatus
    let metacritic, playtime, suggestionsCount: Int
    let userGame: JSONNull?
    let reviewsCount: Int
    let saturatedColor, dominantColor: String
    let platforms: [PlatformElement]
    let parentPlatforms: [ParentPlatform]
    let genres: [Genre]
    let stores: [Store]
    let clip: Clip
    let tags: [Genre]
    let shortScreenshots: [ShortScreenshot]

    enum CodingKeys: String, CodingKey {
        case id, slug, name, released, tba
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case ratings
        case ratingsCount = "ratings_count"
        case reviewsTextCount = "reviews_text_count"
        case added
        case addedByStatus = "added_by_status"
        case metacritic, playtime
        case suggestionsCount = "suggestions_count"
        case userGame = "user_game"
        case reviewsCount = "reviews_count"
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case platforms
        case parentPlatforms = "parent_platforms"
        case genres, stores, clip, tags
        case shortScreenshots = "short_screenshots"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.addedByStatusTask(with: url) { addedByStatus, response, error in
//     if let addedByStatus = addedByStatus {
//       ...
//     }
//   }
//   task.resume()

// MARK: - AddedByStatus
struct AddedByStatus: Codable {
    let yet, owned, beaten, toplay: Int
    let dropped, playing: Int
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.clipTask(with: url) { clip, response, error in
//     if let clip = clip {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Clip
struct Clip: Codable {
    let clip: String
    let clips: Clips
    let video: String
    let preview: String
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.clipsTask(with: url) { clips, response, error in
//     if let clips = clips {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Clips
struct Clips: Codable {
    let the320, the640, full: String

    enum CodingKeys: String, CodingKey {
        case the320 = "320"
        case the640 = "640"
        case full
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.genreTask(with: url) { genre, response, error in
//     if let genre = genre {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name, slug: String
    let gamesCount: Int
    let imageBackground: String
    let domain: String?
    let language: Language?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case domain, language
    }
}

enum Language: String, Codable {
    case eng = "eng"
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.parentPlatformTask(with: url) { parentPlatform, response, error in
//     if let parentPlatform = parentPlatform {
//       ...
//     }
//   }
//   task.resume()

// MARK: - ParentPlatform
struct ParentPlatform: Codable {
    let platform: ParentPlatformPlatform
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.parentPlatformPlatformTask(with: url) { parentPlatformPlatform, response, error in
//     if let parentPlatformPlatform = parentPlatformPlatform {
//       ...
//     }
//   }
//   task.resume()

// MARK: - ParentPlatformPlatform
struct ParentPlatformPlatform: Codable {
    let id: Int
    let name, slug: String
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.platformElementTask(with: url) { platformElement, response, error in
//     if let platformElement = platformElement {
//       ...
//     }
//   }
//   task.resume()

// MARK: - PlatformElement
struct PlatformElement: Codable {
    let platform: PlatformPlatform
    let releasedAt: String
    let requirementsEn: RequirementsEn?
    let requirementsRu: JSONNull?

    enum CodingKeys: String, CodingKey {
        case platform
        case releasedAt = "released_at"
        case requirementsEn = "requirements_en"
        case requirementsRu = "requirements_ru"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.platformPlatformTask(with: url) { platformPlatform, response, error in
//     if let platformPlatform = platformPlatform {
//       ...
//     }
//   }
//   task.resume()

// MARK: - PlatformPlatform
struct PlatformPlatform: Codable {
    let id: Int
    let name, slug: String
    let image, yearEnd: JSONNull?
    let yearStart: Int?
    let gamesCount: Int
    let imageBackground: String

    enum CodingKeys: String, CodingKey {
        case id, name, slug, image
        case yearEnd = "year_end"
        case yearStart = "year_start"
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.requirementsEnTask(with: url) { requirementsEn, response, error in
//     if let requirementsEn = requirementsEn {
//       ...
//     }
//   }
//   task.resume()

// MARK: - RequirementsEn
struct RequirementsEn: Codable {
    let minimum, recommended: String
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.ratingTask(with: url) { rating, response, error in
//     if let rating = rating {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Rating
struct Rating: Codable {
    let id: Int
    let title: String
    let count: Int
    let percent: Double
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.shortScreenshotTask(with: url) { shortScreenshot, response, error in
//     if let shortScreenshot = shortScreenshot {
//       ...
//     }
//   }
//   task.resume()

// MARK: - ShortScreenshot
struct ShortScreenshot: Codable {
    let id: Int
    let image: String
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.storeTask(with: url) { store, response, error in
//     if let store = store {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Store
struct Store: Codable {
    let id: Int
    let store: Genre
    let urlEn: String
    let urlRu: String?

    enum CodingKeys: String, CodingKey {
        case id, store
        case urlEn = "url_en"
        case urlRu = "url_ru"
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func gamesTask(with url: URL, completionHandler: @escaping (Games?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
