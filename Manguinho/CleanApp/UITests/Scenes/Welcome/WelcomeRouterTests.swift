import XCTest
import UIKit
import Presentation
import UI

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


class WelcomeRouterTests: XCTestCase {
    
    func test_gotoLogin_calls_nav_with_correct_viewController(){
        let (sut, nav) = makeSut()
        sut.gotoLogin()
        XCTAssertEqual(nav.viewControllers.count, 1)
        XCTAssertTrue(nav.viewControllers[0] is LoginViewController)
    }
    
    func test_gotoSignUp_calls_nav_with_correct_viewController(){
        let (sut, nav) = makeSut()
        sut.gotoSignUp()
        XCTAssertEqual(nav.viewControllers.count, 1)
        XCTAssertTrue(nav.viewControllers[0] is SignUpViewController)
    }
   
}

extension WelcomeRouterTests {
    func makeSut() -> (sut: WelcomeRouter, nav: NavigationController){
        let nav = NavigationController()
        let loginFactorySpy = LoginFactorySpy()
        let signUpFactorySpy = SignUpFactorySpy()
        let sut = WelcomeRouter(nav: nav, loginFactory: loginFactorySpy.makeLogin, signupFactory: signUpFactorySpy.makeSignUp)
        return(sut, nav)
    }
    
    class LoginFactorySpy {
        func makeLogin () -> LoginViewController {
            return LoginViewController.instantiate()
        }
    }
    
    class SignUpFactorySpy {
        func makeSignUp() -> SignUpViewController{
            return SignUpViewController.instantiate()
        }
    }
}
