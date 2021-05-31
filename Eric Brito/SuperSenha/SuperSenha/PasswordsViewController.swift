//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Joao Queiroz on 14/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {

    
    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOFCharacters: Int = 10
    var numberOfPasswords: Int = 10
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordGenerator: PasswordGenerator!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Total de senhas: \(numberOfPasswords)"
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOFCharacters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)
        
        generatePasswords()
    }
    
    func generatePasswords(){
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPasswords.text = ""
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords{
            tvPasswords.text.append(password + "\n\n")
        }
    }
    
    @IBAction func genetate (_ sender: UIButton){
        generatePasswords()
    }

}
