import XCTest
import Presentation
import Validation

class RequiredFieldValidationTests: XCTestCase {
    func test_validate_should_return_error_if_field_is_not_provided() {
        let sut = makeSut()
        let errorMessage = sut.validate(data: ["name":"John"])
        XCTAssertEqual(errorMessage, "O campo EMAIL é obrigatório!")
    }
    
    func test_validate_should_return_error_with_correct_fieldLabel() {
        let sut = makeSut(fieldName: "age", fieldLabel: "IDADE")
        let errorMessage = sut.validate(data: ["name":"John"])
        XCTAssertEqual(errorMessage, "O campo IDADE é obrigatório!")
    }
    
    func test_validate_should_return_nil_if_field_is_provided() {
        let sut = makeSut()
        let errorMessage = sut.validate(data: ["email":"johndoe@mail.com"])
        XCTAssertNil(errorMessage)
    }
    
    func test_validate_should_return_nil_if_not_data_is_provided() {
        let sut = makeSut()
        let errorMessage = sut.validate(data: nil)
        XCTAssertEqual(errorMessage, "O campo EMAIL é obrigatório!")
    }
}

extension RequiredFieldValidationTests {
    func makeSut(fieldName: String =  "email", fieldLabel: String = "EMAIL", file: StaticString = #filePath, line: UInt = #line) -> Validation {
        let sut = RequiredFieldValidation(fieldName: fieldName, fieldLabel: fieldLabel)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}
