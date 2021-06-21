import XCTest
import Presentation
import Domain
import Data

class LoginPresenterTests: XCTestCase {
    func test_login_should_call_validation_with_correct_values(){
        let validationSpy = ValidationSpy()
        let sut = makeSut(validation: validationSpy)
        let viewModel = makeLoginViewModel()
        sut.login(viewModel: viewModel)
        XCTAssertTrue(NSDictionary(dictionary: validationSpy.data!).isEqual(to: viewModel.toJson()!))
    }
    
    func test_signUp_should_show_error_message_if_validation_fails(){
        let alertViewSpy = AlertViewSpy()
        let validationSpy = ValidationSpy()
        let sut = makeSut(alertView: alertViewSpy, validation: validationSpy)
        let exp = expectation(description: "waiting")
        alertViewSpy.observe { viewModel in
            XCTAssertEqual(viewModel, AlertViewModel(title: "Falha na validação", message: "Erro"))
            exp.fulfill()
        }
        validationSpy.simulateError()
        sut.signUp(viewModel: makeSingUpViewModel())
        wait(for: [exp], timeout: 1)
    }
}

extension LoginPresenterTests{
    
    func makeSut(validation: ValidationSpy = ValidationSpy(),file: StaticString = #filePath, line: UInt = #line) -> LoginPresenter {
        let sut = LoginPresenter(alertView: alertView, addAccount: addAccount, loadingView: loadingView, validation: validation)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}
