import XCTest
import Presentation
import Validation

class CompareFieldsValidationTests: XCTestCase {
    func test_validate_should_return_error_if_comparation_fails() {
        let sut = makeSut(fieldName: "password", fieldNameToCompare: "passwordConfirmation", fieldLabel: "SENHA")
        let errorMessage = sut.validate(data: ["password":"123", "passwordConfirmation":"1234"])
        XCTAssertEqual(errorMessage, "O campo SENHA é inválido!")
    }
    
    func test_validate_should_return_error_with_correct_fiedlLabel() {
        let sut = makeSut(fieldName: "password", fieldNameToCompare: "passwordConfirmation", fieldLabel: "CONFIRMAR SENHA")
        let errorMessage = sut.validate(data: ["password":"123", "passwordConfirmation":"1234"])
        XCTAssertEqual(errorMessage, "O campo CONFIRMAR SENHA é inválido!")
    }
    
    func test_validate_should_return_nil_if_if_comparation_succeeds() {
        let sut = makeSut(fieldName: "password", fieldNameToCompare: "passwordConfirmation", fieldLabel: "SENHA")
        let errorMessage = sut.validate(data: ["password":"123", "passwordConfirmation":"123"])
        XCTAssertNil(errorMessage)
    }
    
    func test_validate_should_return_nil_if_not_data_is_provided() {
        let sut = makeSut(fieldName: "password", fieldNameToCompare: "passwordConfirmation", fieldLabel: "SENHA")
        let errorMessage = sut.validate(data: nil)
        XCTAssertEqual(errorMessage, "O campo SENHA é inválido!")
    }
}

extension CompareFieldsValidationTests {
    func makeSut(fieldName: String =  "email",fieldNameToCompare: String = "email" ,fieldLabel: String = "EMAIL", file: StaticString = #filePath, line: UInt = #line) -> Validation {
        let sut = CompareFieldsValidation(fieldName: fieldName, fieldNameToCompare: fieldNameToCompare, fieldLabel: fieldLabel)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}
