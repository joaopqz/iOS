//
//  ViewController.swift
//  SuperSenha
//
//  Created by Joao Queiroz on 14/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var tfTotalPasswords: UITextField!
    
    @IBOutlet weak var tfNumberofCaracters: UITextField!
    
    @IBOutlet weak var swLetters: UISwitch!
    
    @IBOutlet weak var swNumbers: UISwitch!

    @IBOutlet weak var swCapitalLetters: UISwitch!

    @IBOutlet weak var swSpecialCharacters: UISwitch!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordsViewController
        
        if let numberOfPasswords = Int(tfTotalPasswords.text!){
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        
        if let numberOfCharacters = Int(tfNumberofCaracters.text!){
            passwordsViewController.numberOFCharacters = numberOfCharacters
        }
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLetters = swCapitalLetters.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn
        view.endEditing(true)
    }
}

