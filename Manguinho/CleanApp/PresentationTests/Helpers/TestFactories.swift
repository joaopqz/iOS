import Foundation
import Presentation

func makeSingUpViewModel(name: String? = "John Doe", email: String? = "johndoe@mail.com", password: String? = "secret", passwordConfirmation: String? = "secret") -> SignUpViewModel{
    return SignUpViewModel(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation)
}

func makeLoginViewModel(email: String? = "johndoe@mail.com", password: String? = "secret") -> LoginViewModel{
    return LoginViewModel(email: email, password: password)
}
