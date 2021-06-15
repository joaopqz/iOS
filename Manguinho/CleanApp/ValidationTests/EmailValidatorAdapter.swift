import XCTest
import Presentation
import Validation

class EmailValidatorAdapterTests: XCTestCase {

    func test_invalid_emails(){
        let sut = makeSut()
        XCTAssertFalse(sut.isValid(email: "johndoe"))
        XCTAssertFalse(sut.isValid(email: "johndoe@"))
        XCTAssertFalse(sut.isValid(email: "johndoe@mail"))
        XCTAssertFalse(sut.isValid(email: "johndoe@mail."))
        XCTAssertFalse(sut.isValid(email: "@mail.com"))
    }
    
    func test_valid_emails(){
        let sut = makeSut()
        XCTAssertTrue(sut.isValid(email: "johndoe@mail.com"))
        XCTAssertTrue(sut.isValid(email: "johndoe@gmail.com"))
        XCTAssertTrue(sut.isValid(email: "johndoe@bol.com.br"))
        XCTAssertTrue(sut.isValid(email: "johndoe@hotmail.com"))
    }
}

extension EmailValidatorAdapterTests {
    func makeSut() -> EmailValidatorAdapter {
        return EmailValidatorAdapter()
    }
}
