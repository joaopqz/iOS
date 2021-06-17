import Foundation
import Presentation

func makeSingUpViewModel(name: String? = "John Doe", email: String? = "johndoe@mail.com", password: String? = "secret", passwordConfirmation: String? = "secret") -> SignUpViewModel{
    return SignUpViewModel(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation)
}
