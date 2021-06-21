import Foundation
import Domain

public final class LoginPresenter {
    private let alertView: AlertView
    private let validation: Validation
    private let authentication: Authentication
    
    public init (alertView: AlertView, validation: Validation, authentication: Authentication){
        self.alertView = alertView
        self.validation = validation
        self.authentication = authentication
    }
    
    public func login(viewModel: LoginViewModel){
        if let message = validation.validate(data: viewModel.toJson()) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
        } else{
            authentication.auth(authenticationModel: viewModel.toAuthenticationModel(), completion: { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .failure: self.alertView.showMessage(viewModel: AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu, tente novamente em alguns instantes!!"))
                case .success: break
                }
            })
        }
    }
}
