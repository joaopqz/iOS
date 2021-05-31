//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Joao Queiroz on 11/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import Foundation
import UIKit

class Alerta{
    
    let controller: UIViewController
    
    init (controller:UIViewController){
        self.controller = controller
    }
    
    func exibe(titulo: String = "Atenção", mensagem: String, remover: Bool = false, deleta: ((UIAlertAction) -> Void)? = nil) {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        if (remover){
            let botaoRemover = UIAlertAction(title: "Remover", style: .destructive, handler: deleta)
            alerta.addAction(botaoRemover)
        }
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
    }
}
