//
//  HttpPostClient.swift
//  Data
//
//  Created by João Queiroz | Gerencianet on 02/06/21.
//

import Foundation

public protocol HttpClient {
    
    func post(to url: URL, with data: Data?)
}
