
public final class WelcomeRouter {
    private let nav: NavigationController
    private let loginFactory: () -> LoginViewController
    private let signupFactory: () -> SignUpViewController
    
    public init (nav: NavigationController, loginFactory: @escaping () -> LoginViewController, signupFactory: @escaping () -> SignUpViewController){
        self.nav = nav
        self.loginFactory = loginFactory
        self.signupFactory = signupFactory
    }
    
    public func gotoLogin(){
        nav.pushViewController(loginFactory())
    }
    
    public func gotoSignUp(){
        nav.pushViewController(signupFactory())
    }
}
