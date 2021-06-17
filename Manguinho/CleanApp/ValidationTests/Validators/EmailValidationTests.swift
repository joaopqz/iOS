import XCTest
import Presentation
import Validation

class EmailValidationTests: XCTestCase {
    func test_validate_should_return_error_if_invalid_email_is_provided() {
        let emailValidatorSpy = EmailValidatorSpy()
        let sut =  EmailValidation(fieldName: "email", fieldLabel: "EMAIL", emailValidator: emailValidatorSpy)
        emailValidatorSpy.simulateInvalidEmail()
        let errorMessage = sut.validate(data: ["email":"invalid_mail@mail.com"])
        XCTAssertEqual(errorMessage, "O campo EMAIL é inválido!")
    }
    
    func test_validate_should_return_error_with_correct_field_label() {
        let emailValidatorSpy = EmailValidatorSpy()
        let sut =  EmailValidation(fieldName: "email", fieldLabel: "EMAIL3", emailValidator: emailValidatorSpy)
        emailValidatorSpy.simulateInvalidEmail()
        let errorMessage = sut.validate(data: ["email":"invalid_mail@mail.com"])
        XCTAssertEqual(errorMessage, "O campo EMAIL3 é inválido!")
    }
    
    func test_validate_should_return_nil_if_valid_email_is_provided() {
        let emailValidatorSpy = EmailValidatorSpy()
        let sut =  EmailValidation(fieldName: "email", fieldLabel: "EMAIL", emailValidator: emailValidatorSpy)
        let errorMessage = sut.validate(data: ["email":"johndoe@mail.com"])
        XCTAssertNil(errorMessage)
    }
    
    func test_validate_should_return_nil_if_no_data_is_provided() {
        let emailValidatorSpy = EmailValidatorSpy()
        let sut =  EmailValidation(fieldName: "email", fieldLabel: "EMAIL", emailValidator: emailValidatorSpy)
        let errorMessage = sut.validate(data: nil)
        XCTAssertEqual(errorMessage, "O campo EMAIL é inválido!")
    }
}

extension EmailValidationTests {
    func makeSut(fieldName: String =  "email", fieldLabel: String = "EMAIL", emailValidator: EmailValidatorSpy, file: StaticString = #filePath, line: UInt = #line) -> Validation {
        let sut = EmailValidation(fieldName: fieldName, fieldLabel: fieldLabel, emailValidator: emailValidator)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}

