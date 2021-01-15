//
//  ViewController.swift
//  Mensagens
//
//  Created by Joao Queiroz on 14/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        message = Message()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! MessageColorViewController
        viewController.message = message
    }
    
    
    
}

extension MessageViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        message.text = textField.text!
        lbMessage.text = textField.text!
        textField.resignFirstResponder()
        
        return true
    }
}

extension MessageViewController: ColorPickerDelegate{
    func applyColor(_ color: UIColor){
        lbMessage.textColor = color
        message.textColor = color
    }
}

