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
            authentication.auth(authenticationModel: viewModel.toAuthenticationModel(), completion: {_ in})
        }
    }
}
