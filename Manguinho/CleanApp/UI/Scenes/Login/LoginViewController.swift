import Foundation
import UIKit
import Presentation

public final class LoginViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTF: RoundedTextField!
    @IBOutlet weak var passwordTF: RoundedTextField!
    
    public var login: ((LoginViewModel) -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
    }
    
    private func configure() {
        title = "4Dev"
        loginButton?.layer.cornerRadius = 4
        loginButton?.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        hideKeyboardOnTap()
    }
    
    @objc private func loginButtonTapped() {
        let viewModel = LoginViewModel(email: emailTF.text!, password: passwordTF.text!)
        login?(viewModel)
    }
    
}

extension LoginViewController: LoadingView {
    public func display(viewModel: LoadingViewModel) {
        if viewModel.isLoading{
            view.isUserInteractionEnabled = false
            loadingIndicator?.startAnimating()
        } else{
            view.isUserInteractionEnabled = true
            loadingIndicator?.stopAnimating()
        }
    }
}

extension LoginViewController: AlertView {
    public func showMessage(viewModel: AlertViewModel) {
        let alert = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
