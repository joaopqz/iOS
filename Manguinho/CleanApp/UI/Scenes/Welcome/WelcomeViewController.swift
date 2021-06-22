import Foundation
import UIKit

public final class WelcomeViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    public var login: (() -> Void)?
    public var signUp: (() -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
    }
    
    private func configure() {
        title = "4Dev"
        loginButton?.layer.cornerRadius = 4
        loginButton?.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        signUpButton?.layer.cornerRadius = 4
        signUpButton?.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
    }
    
    @objc private func loginButtonTapped() {
        login?()
    }
    
    @objc private func signUpButtonTapped() {
        signUp?()
    }
}
