//
//  PresentationTests.swift
//  PresentationTests
//
//  Created by João Queiroz | Gerencianet on 11/06/21.
//

import XCTest
import Domain

class SignUpPresenter {
    
    private let alertView: AlertView
    
    init (alertView: AlertView){
        self.alertView = alertView
    }
    
    func signUp(viewModel: SignUpViewModel){
        if viewModel.name == nil || viewModel.name!.isEmpty {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: "Campo NOME é obrigatório!!"))
        } else if viewModel.email == nil || viewModel.email!.isEmpty {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: "Campo EMAIL é obrigatório!!"))
        } else if viewModel.password == nil || viewModel.password!.isEmpty {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: "Campo SENHA é obrigatório!!"))
        } else if viewModel.passwordConfimation == nil || viewModel.passwordConfimation!.isEmpty {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: "Campo CONFIRMAR SENHA é obrigatório!!"))
        }
    }
}

protocol AlertView{
    func showMessage(viewModel: AlertViewModel)
}

struct AlertViewModel: Equatable{
    var title: String
    var message: String
}


struct SignUpViewModel{
    var name: String?
    var email: String?
    var password: String?
    var passwordConfimation: String?
}


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
