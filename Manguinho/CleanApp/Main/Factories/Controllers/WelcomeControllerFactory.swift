import Foundation
import UI

public func makeWelcomeController(nav: NavigationController) -> WelcomeViewController{
    let controller = WelcomeViewController.instantiate()
    let router = WelcomeRouter(nav: nav, loginFactory: makeLoginController, signupFactory: makeSignUpController)
    controller.signUp = router.gotoSignUp
    controller.login = router.gotoLogin
    return controller
    
}
