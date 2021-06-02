//
//  AccountModel.swift
//  Domain
//
//  Created by João Queiroz | Gerencianet on 31/05/21.
//

import Foundation

public struct AccountModel: Codable {
    public var id: String
    public var name: String
    public var email: String
    public var password: String
}