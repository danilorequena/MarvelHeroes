//
//  MarvelClasses.swift
//  MarvelSuperHeroes
//
//  Created by Danilo Requena on 14/03/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import Foundation


struct MarvelInfo: Codable {
    let code: Int
    let status: String
    let data: MarvelData
}

struct MarvelData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Hero]
}

struct Hero: Codable {
    let id : Int
    let name : String
    let description: String
    let thumbnail: Thumbnail
    let url: [HeroURL]
}

struct Thumbnail: Codable {
    let path: String
    let ext: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}

struct HeroURL: Codable {
    let type: String
    let url: String
}