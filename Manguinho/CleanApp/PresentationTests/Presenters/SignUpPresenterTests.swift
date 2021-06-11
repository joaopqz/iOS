import XCTest
import Presentation

class SignUpPresenterTests: XCTestCase {

    func test_signUp_should_show_error_message_if_name_is_not_provided(){
        let (sut, alertViewSpy, _) = makeSut()
        let signUpViewModel = SignUpViewModel(email: "johndoe@mail.com.br", password: "secret", passwordConfimation: "secret")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Campo NOME é obrigatório!!"))
    }
    
    func test_signUp_should_show_error_message_if_email_is_not_provided(){
        let (sut, alertViewSpy, _) = makeSut()
        let signUpViewModel = SignUpViewModel(name: "John Doe", password: "secret", passwordConfimation: "secret")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Campo EMAIL é obrigatório!!"))
    }

    func test_signUp_should_show_error_message_if_password_is_not_provided(){
        let (sut, alertViewSpy, _) = makeSut()
        let signUpViewModel = SignUpViewModel(name: "John Doe", email: "johndoe@mail.com", passwordConfimation: "secret")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Campo SENHA é obrigatório!!"))
    }
    
    func test_signUp_should_show_error_message_if_passwordConfirmation_is_not_provided(){
        let (sut, alertViewSpy, _) = makeSut()
        let signUpViewModel = SignUpViewModel(name: "John Doe", email: "johndoe@mail.com", password: "secret")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Campo CONFIRMAR SENHA é obrigatório!!"))
    }
    
    func test_signUp_should_show_error_message_if_passwordConfirmation_is_not_match(){
        let (sut, alertViewSpy, _) = makeSut()
        let signUpViewModel = SignUpViewModel(name: "John Doe", email: "johndoe@mail.com", password: "secret", passwordConfimation: "doe1234")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Falha ao confirmar senha!!"))
    }
    
    func test_signUp_should_call_emailValidator_with_correct_email(){
        let (sut, _ ,emailValidatorSpy) = makeSut()
        let signUpViewModel = SignUpViewModel(name: "John Doe", email: "invalid_johndoe@mail.com", password: "secret", passwordConfimation: "secret")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(emailValidatorSpy.email, signUpViewModel.email)
    }

    
}

extension SignUpPresenterTests{
    
    func makeSut() -> (sut: SignUpPresenter, alertViewSpy: AlertViewSpy, emailValidatorSpy: EmailValidatorSpy){
        let alertViewSpy = AlertViewSpy()
        let emailValidatorSpy = EmailValidatorSpy()
        let sut = SignUpPresenter(alertView: alertViewSpy, emailValidator: emailValidatorSpy)
        return (sut, alertViewSpy, emailValidatorSpy)
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
