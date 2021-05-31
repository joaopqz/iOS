//
//  Quote.swift
//  Pensamentos
//
//  Created by Joao Queiroz on 18/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import Foundation

struct Quote: Codable {
    
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String{
        return " “" + quote + "” "
    }
    
    var authorFormatted: String{
        return "- " + author + " -"
    }
}
