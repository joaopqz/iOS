import Foundation
import UI
import Presentation
import Validation
import Domain

public func makeSignUpController() -> SignUpViewController{
    return makeSignUpController(with: makeRemoteAddAccount())
}

public func makeSignUpController(with addAccount: AddAccount) -> SignUpViewController{
    let controller = SignUpViewController.instantiate()
    let validationComposite = ValidationComposite(validations: makeSignUpValidations())
    let presenter = SignUpPresenter(alertView: WeakVarProxy(controller), addAccount: addAccount, loadingView: WeakVarProxy(controller), validation: validationComposite)
    controller.signUp = presenter.signUp
    return controller
}

public func makeSignUpValidations() -> [Validation]{
    return[
        RequiredFieldValidation(fieldName: "name", fieldLabel: "NOME"),
        RequiredFieldValidation(fieldName: "email", fieldLabel: "EMAIL"),
        EmailValidation(fieldName: "email", fieldLabel: "EMAIL", emailValidator: makeEmailValidatorAdapter()),
        RequiredFieldValidation(fieldName: "password", fieldLabel: "SENHA"),
        RequiredFieldValidation(fieldName: "passwordConfirmation", fieldLabel: "CONFIRMAR SENHA"),
        CompareFieldsValidation(fieldName: "password", fieldNameToCompare: "passwordConfirmation", fieldLabel: "CONFIRMAR SENHA")
    ]
}
