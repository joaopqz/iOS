//
//  Viagem.swift
//  Alura Viagens
//
//  Created by Joao Queiroz on 12/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class Viagem: NSObject {
    let titulo: String
    let quantidadeDeDias: Int
    let preco: String
    let caminhoDaImagem: String
    
    init(titulo: String, quantidadeDeDias: Int, preco: String, caminhoDaImagem:String){
        self.titulo = titulo
        self.quantidadeDeDias = quantidadeDeDias
        self.preco = preco
        self.caminhoDaImagem = caminhoDaImagem
    }

}
