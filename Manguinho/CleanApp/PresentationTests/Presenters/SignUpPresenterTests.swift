import XCTest
import Presentation

class SignUpPresenterTests: XCTestCase {

    func test_signUp_should_show_error_message_if_name_is_not_provided(){
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(alertView: alertViewSpy)
        sut.signUp(viewModel: makeSingUpViewModel(name: nil))
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Campo NOME é obrigatório!!"))
    }
    
    func test_signUp_should_show_error_message_if_email_is_not_provided(){
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(alertView: alertViewSpy)
        sut.signUp(viewModel: makeSingUpViewModel(email: nil))
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Campo EMAIL é obrigatório!!"))
    }

    func test_signUp_should_show_error_message_if_password_is_not_provided(){
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(alertView: alertViewSpy)
        sut.signUp(viewModel: makeSingUpViewModel(password: nil))
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Campo SENHA é obrigatório!!"))
    }
    
    func test_signUp_should_show_error_message_if_passwordConfirmation_is_not_provided(){
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(alertView: alertViewSpy)
        sut.signUp(viewModel: makeSingUpViewModel(passwordConfirmation: nil))
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Campo CONFIRMAR SENHA é obrigatório!!"))
    }
    
    func test_signUp_should_show_error_message_if_passwordConfirmation_is_not_match(){
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(alertView: alertViewSpy)
        sut.signUp(viewModel: makeSingUpViewModel(password: "doe1234"))
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Falha ao confirmar senha!!"))
    }
    
    func test_signUp_should_call_emailValidator_with_correct_email(){
        let emailValidatorSpy = EmailValidatorSpy()
        let sut = makeSut(emailValidator: emailValidatorSpy)
        let signUpViewModel = makeSingUpViewModel()
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(emailValidatorSpy.email, signUpViewModel.email)
    }
    
    func test_signUp_should_show_error_message_if_invalid_email_is_provided(){
        let emailValidatorSpy = EmailValidatorSpy()
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(alertView: alertViewSpy, emailValidator: emailValidatorSpy)
        emailValidatorSpy.isValid = false
        sut.signUp(viewModel: makeSingUpViewModel())
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Email inválido!!"))
    }

    
}

extension SignUpPresenterTests{
    
    func makeSut(alertView: AlertViewSpy = AlertViewSpy(), emailValidator: EmailValidatorSpy = EmailValidatorSpy()) -> SignUpPresenter {
        let sut = SignUpPresenter(alertView: alertView, emailValidator: emailValidator)
        return sut
    }
    
    func makeSingUpViewModel(name: String? = "John Doe", email: String? = "invalid_johndoe@mail.com", password: String? = "secret", passwordConfirmation: String? = "secret") -> SignUpViewModel{
        return SignUpViewModel(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation)
    }
 
    class AlertViewSpy: AlertView {
        var viewModel: AlertViewModel?
        
        func showMessage(viewModel: AlertViewModel) {
            self.viewModel = viewModel
        }
        
    }
    
    class EmailValidatorSpy: EmailValidator {
        
        var isValid = true
        var email: String?
        
        func isValid(email: String) -> Bool {
            self.email = email
            return isValid
        }
        
    }
    
}
