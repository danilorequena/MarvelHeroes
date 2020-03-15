//
//  MarvelAPI.swift
//  MarvelSuperHeroes
//
//  Created by Danilo Requena on 14/03/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire


class MarvelAPI {
    
    
    static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    static private let privateKey = "3267536b86be26574e12b4db918a94193d7ff300"
    static private let publicKey = "f52691161f65bffaf2574bbe987237c4"
    static private let limit = 50
    
    class func loadHeroes(name: String?, page: Int = 0, oncomplete: @escaping (MarvelInfo?) -> Void) {
        let offset = page * limit
        let startsWith: String
        if let name = name, !name.isEmpty {
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startsWith = ""
        }
        let url = basePath + "offset=\(offset)&limit=\(limit)&" + startsWith + getCredentials()
        print(url)
        AF.request(url).responseJSON { (response) in
            guard let data = response.data,
                let marvelInfo = try? JSONDecoder().decode(MarvelInfo.self, from: data),
                marvelInfo.code == 200 else {
                    oncomplete(nil)
                    return
            }
            oncomplete(marvelInfo)
        }
    }
    
    private class func getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts + privateKey + publicKey).lowercased()
        
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
