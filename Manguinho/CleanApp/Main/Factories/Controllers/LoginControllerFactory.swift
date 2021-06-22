import Foundation
import UI
import Presentation
import Validation
import Domain

public func makeLoginController() -> LoginViewController{
    
    return makeLoginControllerWith(authentication: makeRemoteAuthentication())
}

public func makeLoginControllerWith(authentication: Authentication) -> LoginViewController{
    let controller = LoginViewController.instantiate()
    let validationComposite = ValidationComposite(validations: makeLoginValidations())
    let presenter = LoginPresenter(alertView: WeakVarProxy(controller), validation: validationComposite, authentication: authentication, loadingView: WeakVarProxy(controller))
    controller.login = presenter.login
    return controller
}

public func makeLoginValidations() -> [Validation]{
    return[
        RequiredFieldValidation(fieldName: "email", fieldLabel: "EMAIL"),
        EmailValidation(fieldName: "email", fieldLabel: "EMAIL", emailValidator: makeEmailValidatorAdapter()),
        RequiredFieldValidation(fieldName: "password", fieldLabel: "SENHA"),
    ]
}
