//
//  ScreenColorViewController.swift
//  Mensagens
//
//  Created by Joao Queiroz on 14/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class ScreenColorViewController: BaseViewController {
    
    @IBOutlet weak var viBorder: UIView!
    
    @IBOutlet weak var swWhiteBorder: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbMessage.text = message.text
        lbMessage.textColor = message.textColor
        lbMessage.backgroundColor = message.backgroundColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    @IBAction func changeBorder(_ sender: UISwitch) {
        viBorder.backgroundColor = sender.isOn ? .white : .clear
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          let viewController = segue.destination as! ResultViewController
          viewController.message = message
        viewController.useWhiteColor = swWhiteBorder.isOn
      }
    
}

extension ScreenColorViewController: ColorPickerDelegate{
    func applyColor(_ color: UIColor) {
        view.backgroundColor = color
        message.screenColor = color
    }
}

