import Foundation
import Presentation

func makeSingUpViewModel(name: String? = "John Doe", email: String? = "johndoe@mail.com", password: String? = "secret", passwordConfirmation: String? = "secret") -> SignUpViewModel{
    return SignUpViewModel(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation)
}

func makeRequiredAlertViewModel(fieldName: String) -> AlertViewModel {
    return AlertViewModel(title: "Falha na validação", message: "Campo \(fieldName) é obrigatório!!")
}

func makeInvalidAlertViewModel(fieldName: String) -> AlertViewModel {
    return AlertViewModel(title: "Falha na validação", message: "Campo \(fieldName) é inválido!!")
}

func makeErrorAlertViewModel(message: String) -> AlertViewModel {
    return AlertViewModel(title: "Erro", message: message)
}

func makeSuccessAlertViewModel(message: String) -> AlertViewModel {
    return AlertViewModel(title: "Sucesso", message: message)
}
