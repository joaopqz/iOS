//
//  Item.swift
//  eggplant-brownie
//
//  Created by Joao Queiroz on 04/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
    
    //MARK: - Atributos
    var nome: String
    var calorias: Double
    
    
    //MARK: - Init
    init (nome:String, calorias: Double){
        self.nome = nome
        self.calorias = calorias
    }
    
    //MARK: - NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(nome,forKey: "itemNome")
        coder.encode(calorias, forKey: "calorias")
    }
        
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "itemNome") as! String
        calorias = coder.decodeDouble(forKey: "calorias")
    }
    
    //MARK: - Métodos
}
