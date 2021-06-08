import Foundation
import Domain

func makeAccountModel() -> AccountModel{
    return  AccountModel(id: "any_id", name: "John Doe", email: "johndoe@mail.com", password: "doe1234")
}
