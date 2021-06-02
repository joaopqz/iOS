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

public struct AddAccountModel {
    public var name: String
    public var email: String
    public var password: String
    public var passwordConfimation: String
}
