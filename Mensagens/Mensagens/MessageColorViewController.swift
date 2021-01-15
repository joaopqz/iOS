//
//  MessageColorViewController.swift
//  Mensagens
//
//  Created by Joao Queiroz on 14/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class MessageColorViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbMessage.text = message.text
        lbMessage.textColor = message.textColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          let viewController = segue.destination as! ScreenColorViewController
          viewController.message = message
      }
    
}

extension MessageColorViewController: ColorPickerDelegate{
    func applyColor(_ color: UIColor){
        lbMessage.backgroundColor = color
        message.backgroundColor = color
    }
}

