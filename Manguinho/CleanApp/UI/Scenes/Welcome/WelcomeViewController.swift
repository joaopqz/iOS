import Foundation
import UIKit

public final class WelcomeViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    public var login: (() -> Void)?
    
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
        login?()
    }
    
}