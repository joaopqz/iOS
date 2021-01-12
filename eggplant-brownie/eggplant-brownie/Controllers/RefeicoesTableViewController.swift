//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Joao Queiroz on 07/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    var refeicoes: [Refeicao] = []
    
    override func viewDidLoad() {
        let listaRefeicoes = RefeicaoDao().recupera()
        refeicoes = listaRefeicoes
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    func add(_ refeicao:Refeicao){
        refeicoes.append(refeicao)
        RefeicaoDao().save(refeicoes)
        tableView.reloadData()
    }
    
    
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        
        if gesture.state == .began{
            let celulas = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celulas) else {return}
            
            let refeicao = refeicoes[indexPath.row]
            
            Alerta.init(controller: self).exibe(titulo: refeicao.nome, mensagem: refeicao.detalhes(), remover: true, deleta: {alerta in
                self.refeicoes.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
            
            
        
        }
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar"{
            if let viewController = segue.destination as? ViewController{
                viewController.delegate = self
            }
        }
        
    }
}
