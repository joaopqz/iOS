import Foundation

 protocol AddAccount{
    
    func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, Error>) -> Void)
    
}

public struct AddAccountModel:Model {
    public var name: String
    public var email: String
    public var password: String
    public var passwordConfimation: String
    
    public init(name:String, email: String, password: String, passwordConfimation: String){
        self.name = name
        self.email = email
        self.password = password
        self.passwordConfimation = passwordConfimation
    }
}
