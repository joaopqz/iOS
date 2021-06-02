//
//  Model.swift
//  Domain
//
//  Created by João Queiroz | Gerencianet on 02/06/21.
//

import Foundation

public protocol Model: Codable {}

public extension Model{
    
    func toData() -> Data?{
        return try? JSONEncoder().encode(self)
    }
    
}
