//
//  ResultViewController.swift
//  Mensagens
//
//  Created by Joao Queiroz on 14/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class ResultViewController: BaseViewController {

    @IBOutlet weak var viBorder: UIView!
    
    var useWhiteColor: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbMessage.text = message.text
        lbMessage.textColor = message.textColor
        lbMessage.backgroundColor = message.backgroundColor
        view.backgroundColor = message.screenColor
        viBorder.backgroundColor = useWhiteColor ? .white : .clear
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.popViewController(animated: true)
    }
}
