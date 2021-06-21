import XCTest
import Main
import UI
import Validation

class LoginCotrollerTests: XCTestCase {
/*
    func test_background_request_should_complete_on_main_thread(){
       let (sut, addAccountSpy) = makeSut()
        sut.loadViewIfNeeded()
        sut.signUp?(makeSignUpViewModel())
        let exp = expectation(description: "Waiting")
        DispatchQueue.global().async {
            addAccountSpy.completeWithError(.unexpected)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
*/
    func test_login_compose_with_correct_validations(){
        let validations = makeLoginValidations()
        XCTAssertEqual(validations[0] as? RequiredFieldValidation, RequiredFieldValidation(fieldName: "email", fieldLabel: "EMAIL"))
        XCTAssertEqual(validations[1] as? EmailValidation, EmailValidation(fieldName: "email", fieldLabel: "EMAIL", emailValidator: EmailValidatorSpy()))
        XCTAssertEqual(validations[2] as? RequiredFieldValidation, RequiredFieldValidation(fieldName: "password", fieldLabel: "SENHA"))
    }
    
    
    
    
}

extension LoginCotrollerTests{
    func makeSut(file: StaticString = #filePath, line: UInt = #line) -> (sut: LoginViewController, authenticationSpy: AuthenticationSpy){
        let authenticationSpy = AuthenticationSpy()
        let sut = makeLoginController(authentication: authenticationSpy)
        checkMemoryLeak(for: sut, file: file, line: line)
        checkMemoryLeak(for: authenticationSpy, file: file, line: line)
        return (sut, authenticationSpy)
    }
}
