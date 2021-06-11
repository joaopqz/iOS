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
        let alertViewSpy = AlertViewSpy()
        let sut = SignUpPresenter(alertView: alertViewSpy)
        let signUpViewModel = SignUpViewModel(email: "johndoe@mail.com.br", password: "secret", passwordConfimation: "secret")
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Campo NOME é obrigatório!!"))
    }

}

extension SignUpPresenterTests{
 
    class AlertViewSpy: AlertView {
        var viewModel: AlertViewModel?
        
        func showMessage(viewModel: AlertViewModel) {
            self.viewModel = viewModel
        }
        
    }
    
}
