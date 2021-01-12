//
//  RefeicaoDao.swift
//  eggplant-brownie
//
//  Created by Joao Queiroz on 12/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import Foundation

class RefeicaoDao{
    func recuperaCaminho () -> URL?{
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let caminho = diretorio.appendingPathComponent("refeicao")
        
        return caminho
    }
    
    func save(_ refeicoes: [Refeicao]){
        guard let caminho = recuperaCaminho() else {return}
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch{
            print(error.localizedDescription)
            
        }
    }
    
    func recupera() -> [Refeicao] {
        guard let caminho = recuperaCaminho() else {return []}
        do{
            let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Refeicao> else {return []}
            return refeicoesSalvas
        } catch{
            print(error.localizedDescription)
            return []
        }
        
    }
}
