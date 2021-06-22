import XCTest
import Main
import UI
import Validation

class SignUpCotrollerTests: XCTestCase {

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

    func test_signUp_compose_with_correct_validations(){
        let validations = makeSignUpValidations()
        XCTAssertEqual(validations[0] as? RequiredFieldValidation, RequiredFieldValidation(fieldName: "name", fieldLabel: "NOME"))
        XCTAssertEqual(validations[1] as? RequiredFieldValidation, RequiredFieldValidation(fieldName: "email", fieldLabel: "EMAIL"))
        XCTAssertEqual(validations[2] as? EmailValidation, EmailValidation(fieldName: "email", fieldLabel: "EMAIL", emailValidator: EmailValidatorSpy()))
        XCTAssertEqual(validations[3] as? RequiredFieldValidation, RequiredFieldValidation(fieldName: "password", fieldLabel: "SENHA"))
        XCTAssertEqual(validations[4] as? RequiredFieldValidation, RequiredFieldValidation(fieldName: "passwordConfirmation", fieldLabel: "CONFIRMAR SENHA"))
        XCTAssertEqual(validations[5] as? CompareFieldsValidation, CompareFieldsValidation(fieldName: "password", fieldNameToCompare: "passwordConfirmation", fieldLabel: "CONFIRMAR SENHA"))
    }
    
    
    
    
}

extension SignUpCotrollerTests{
    func makeSut(file: StaticString = #filePath, line: UInt = #line) -> (sut: SignUpViewController, addAccountSpy: AddAccountSpy){
        let addAccountSpy = AddAccountSpy()
        let sut = makeSignUpController(with: MainQueueDispatchDecorator(addAccountSpy))
        checkMemoryLeak(for: sut, file: file, line: line)
        checkMemoryLeak(for: addAccountSpy, file: file, line: line)
        return (sut, addAccountSpy)
    }
}
