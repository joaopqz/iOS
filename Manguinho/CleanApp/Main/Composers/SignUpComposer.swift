import Foundation
import UI
import Presentation
import Validation
import Domain
import Infra

public final class SignUpComposer {
    
    public static func composeControllerWith(addAccount: AddAccount) -> SignUpViewController{
        let controller = SignUpViewController.instantiate()
        let validationComposite = ValidationComposite(validations: makeValidations())
        let presenter = SignUpPresenter(alertView: WeakVarProxy(controller), addAccount: addAccount, loadingView: WeakVarProxy(controller), validation: validationComposite)
        controller.signUp = presenter.signUp
        return controller
    }
    
    public static func makeValidations() -> [Validation]{
        return[
            RequiredFieldValidation(fieldName: "name", fieldLabel: "NOME"),
            RequiredFieldValidation(fieldName: "email", fieldLabel: "EMAIL"),
            EmailValidation(fieldName: "email", fieldLabel: "EMAIL", emailValidator: EmailValidatorAdapter()),
            RequiredFieldValidation(fieldName: "password", fieldLabel: "SENHA"),
            RequiredFieldValidation(fieldName: "passwordConfirmation", fieldLabel: "CONFIRMAR SENHA"),
            CompareFieldsValidation(fieldName: "password", fieldNameToCompare: "passwordConfirmation", fieldLabel: "CONFIRMAR SENHA")
        ]
    }
}
