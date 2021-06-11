import XCTest
import Presentation

class SignUpPresenterTests: XCTestCase {

    func test_signUp_shoul_show_error_message_if_name_is_not_provided(){
        let (sut, alertViewSpy) = makeSut()
        let signUpViewModel = SignUpViewModel(email: "johndoe@mail.com.br", password: "secret", passwordConfimation: "secret")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Campo NOME é obrigatório!!"))
    }
    
    func test_signUp_shoul_show_error_message_if_email_is_not_provided(){
        let (sut, alertViewSpy) = makeSut()
        let signUpViewModel = SignUpViewModel(name: "John Doe", password: "secret", passwordConfimation: "secret")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Campo EMAIL é obrigatório!!"))
    }

    func test_signUp_shoul_show_error_message_if_password_is_not_provided(){
        let (sut, alertViewSpy) = makeSut()
        let signUpViewModel = SignUpViewModel(name: "John Doe", email: "johndoe@mail.com", passwordConfimation: "secret")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Campo SENHA é obrigatório!!"))
    }
    
    func test_signUp_shoul_show_error_message_if_passwordConfirmation_is_not_provided(){
        let (sut, alertViewSpy) = makeSut()
        let signUpViewModel = SignUpViewModel(name: "John Doe", email: "johndoe@mail.com", password: "secret")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Campo CONFIRMAR SENHA é obrigatório!!"))
    }
    
    func test_signUp_shoul_show_error_message_if_passwordConfirmation_is_not_match(){
        let (sut, alertViewSpy) = makeSut()
        let signUpViewModel = SignUpViewModel(name: "John Doe", email: "johndoe@mail.com", password: "secret", passwordConfimation: "doe1234")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Falha ao confirmar senha!!"))
    }

    
}

extension SignUpPresenterTests{
    
    func makeSut() -> (sut: SignUpPresenter, alertViewSpy: AlertViewSpy){
        let alertViewSpy = AlertViewSpy()
        let sut = SignUpPresenter(alertView: alertViewSpy)
        return (sut, alertViewSpy)
    }
    
 
    class AlertViewSpy: AlertView {
        var viewModel: AlertViewModel?
        
        func showMessage(viewModel: AlertViewModel) {
            self.viewModel = viewModel
        }
        
    }
    
}
