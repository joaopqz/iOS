import Foundation
import Domain
import Presentation

public final class LoginPresenter {
    

    private let validation: Validation
    
    public init (validation: Validation){
        self.validation = validation
    }
    
    public func login(viewModel: LoginViewModel){
       _ = validation.validate(data: viewModel.toJson())
    }
}
