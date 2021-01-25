//
//  MarvelAPI.swift
//  HeroisMarvel
//
//  Created by Joao Queiroz on 25/01/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelAPI {
    static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    static private let privateKey = "c8cd843747fdb215df823edb490873a63ca71f48"
    static private let publicKey = "21d4add752e1a8b40aa663ac75b2f660"
    static private let limit  = 50
    
    class func loadHeroes(name:String?, page: Int = 0, onComplete: @escaping (MarvelInfo?) -> Void){
        let offset = page * limit
        let startsWith: String
        if let name = name, !name.isEmpty{
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else{
            startsWith = ""
        }
        
        let url = basePath + "offset=\(offset)&limit=\(limit)&" + startsWith + getCredentials()
        print(url)
        
        Alamofire.request(url).responseJSON { (response) in
            guard let data = response.data else{
                onComplete(nil)
                return
            }
            do {
                let marvelInfo = try JSONDecoder().decode(MarvelInfo.self, from: data)
                onComplete(marvelInfo)
            } catch{
                onComplete(nil)
                print(error.localizedDescription)
            }
        }
    }
    
    private class func getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
