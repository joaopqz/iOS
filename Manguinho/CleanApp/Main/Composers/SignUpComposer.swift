import Foundation
import UI
import Presentation
import Validation
import Domain

public final class SignUpComposer {
    
    public static func composeControllerWith(addAccount: AddAccount) -> SignUpViewController{
        let controller = SignUpViewController.instantiate()
        let emailValidatorAdapter = EmailValidatorAdapter()
        let presenter = SignUpPresenter(alertView: WeakVarProxy(controller), emailValidator: emailValidatorAdapter, addAccount: addAccount, loadingView: controller)
        controller.signUp = presenter.signUp
        return controller
    }
}
