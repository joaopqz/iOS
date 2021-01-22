//
//  Trailer.swift
//  TrailerFlix
//
//  Created by Joao Queiroz on 22/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import Foundation

struct Trailer: Codable {
    let title: String
    let url: String
    let rating: Int
    let year: Int
    let poster: String
}
