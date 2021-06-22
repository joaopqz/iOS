import Foundation
import Presentation

func makeSignUpViewModel(name: String? = "John Doe", email: String? = "johndoe@mail.com", password: String? = "secret", passwordConfirmation: String? = "secret") -> SignUpRequest{
    return SignUpRequest(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation)
}

func makeLoginViewModel(email: String? = "johndoe@mail.com", password: String? = "secret") -> LoginRequest{
    return LoginRequest(email: email, password: password)
}
