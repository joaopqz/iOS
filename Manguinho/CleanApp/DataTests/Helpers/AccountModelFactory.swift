import Foundation
import Domain

func makeAccountModel() -> AccountModel{
    return  AccountModel(accessToken: "A52sd54SV")
}

func makeAddAccountModel() -> AddAccountModel{
    return  AddAccountModel(name: "John Doe", email: "johndoe@mail.com", password: "secret", passwordConfimation: "secret")
}
