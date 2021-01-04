//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Joao Queiroz on 04/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class Refeicao: NSObject {
    var nome: String
    var felicidade:Int
    var itens: Array<Item> = []
    
    init(nome:String, felicidade: Int){
        self.nome = nome
        self.felicidade = felicidade
    }
    
    func totalDeCalorias() -> Double{
        var total = 0.0
        
        for item in itens{
            total += item.calorias
        }
        
        return total
    }
}
