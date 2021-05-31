//
//  AddAccount.swift
//  Domain
//
//  Created by João Queiroz | Gerencianet on 31/05/21.
//

import Foundation

protocol AddAccount{
    
    func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, Error>) -> Void)
    
}

struct AddAccountModel {
    var name: String
    var email: String
    var password: String
    var passwordConfimation: String
}
