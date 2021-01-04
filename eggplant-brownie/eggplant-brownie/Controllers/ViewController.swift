//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Joao Queiroz on 04/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nomeTextField: UITextField?
     
    @IBOutlet weak var felicidadeTextField: UITextField?
    @IBAction func AdicionarButton(_ sender: Any) {
        
        if let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextField?.text{

            let nome = nomeDaRefeicao
            if let felicidade = Int(felicidadeDaRefeicao){
                let refeicao = Refeicao(nome:nome, felicidade: felicidade)
                print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
            }
        } else{
            print("Erro ao tentar criar refeição")
        }
        
        
    }
    
   
    
}

