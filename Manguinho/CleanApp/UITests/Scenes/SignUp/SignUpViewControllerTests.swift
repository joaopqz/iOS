import XCTest
import UIKit
import Presentation

@testable import UI

class SignUpViewControllerTests: XCTestCase {
    
    func test_loading_is_hidden_on_start(){
        XCTAssertEqual(makeSut().loadingIndicator?.isAnimating, false)
    }
    
    func test_sut_implements_loadingView(){
        XCTAssertNotNil(makeSut() as LoadingView)
    }
    
    func test_sut_implements_alertView(){
        XCTAssertNotNil(makeSut() as AlertView)
    }
    
    func test_saveButton_calls_signUp_on_tap(){
        var signUpViewModel: SignUpViewModel?
        let sut = makeSut(signUpSpy: { signUpViewModel = $0})
        sut.saveButton?.simulateTap()
        let name = sut.nameTF?.text
        let email = sut.emailTF?.text
        let password = sut.passwordTF?.text
        let passwordConfirmation = sut.passwordConfirmationTF?.text
        XCTAssertEqual(signUpViewModel, SignUpViewModel(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation))
    }
}

extension SignUpViewControllerTests {
    func makeSut(signUpSpy: ((SignUpViewModel) -> Void)? = nil) -> SignUpViewController {
        let sb = UIStoryboard(name: "SignUp", bundle: Bundle(for: SignUpViewController.self))
        let sut = sb.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        sut.signUp = signUpSpy
        sut.loadViewIfNeeded()
        return sut
    }
}