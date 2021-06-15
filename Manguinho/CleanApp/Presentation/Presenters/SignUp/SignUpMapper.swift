import Foundation
import Domain

public final class SignUpMapper{
    static public func toAddAccountModel(viewModel: SignUpViewModel) -> AddAccountModel{
        return AddAccountModel(name: viewModel.name!, email: viewModel.email!, password: viewModel.password!, passwordConfimation: viewModel.passwordConfirmation!)
    }
}
