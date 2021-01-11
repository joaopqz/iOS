//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Joao Queiroz on 04/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao:Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    
    // MARK: - Atributos
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = [Item(nome: "Molho de tomate", calorias: 40.0),
                         Item(nome: "Queijo", calorias: 40.0),
                         Item(nome: "Molho apimentado", calorias: 40.0),
                         Item(nome: "Manjericão", calorias: 40.0)]
    
    var itensSelecionados: [Item] = []
    
    //MARK: - IBOutlets
    @IBOutlet weak var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView?
    
    
    // MARK: - View Life Cycle
    
  override func viewDidLoad() {
        super.viewDidLoad()
    
    let botaoAdicionarItem = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector(adicionarItem))
    
        navigationItem.rightBarButtonItem = botaoAdicionarItem
    }
    
    @objc func adicionarItem(){
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        
        if let tableView = itensTableView{
            tableView.reloadData()
        }
        else{
            Alerta(controller: self).exibe(mensagem: "Não foi possível atualizar a tabela")
        }
    }
    
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = itens[indexPath.row].nome
        
        return celula
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let celula = tableView.cellForRow(at: indexPath) else{ return }
        
        if celula.accessoryType == .none{
          celula.accessoryType = .checkmark
            itensSelecionados.append(itens[indexPath.row])
        } else{
            celula.accessoryType = .none
            if let position = itensSelecionados.firstIndex(of: itens[indexPath.row]){
                itensSelecionados.remove(at: position)
            }
        }
        
    }
    
    //MARK: - IBActions
    @IBAction func AdicionarButton(_ sender: Any) {
        

        
        guard let refeicao = recuperaRefeicaoDoFormulario() else{ return }
        delegate?.add(refeicao)
        
        navigationController?.popViewController(animated: true)
        
    }
    
    //MARK: - Métodos
    func recuperaRefeicaoDoFormulario() -> Refeicao? {
        guard let nomeDaRefeicao = nomeTextField?.text else{
            Alerta(controller: self).exibe(mensagem: "Erro ao ler o campo nome")
            return nil
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else{
            Alerta(controller: self).exibe(mensagem: "Erro ao ler o campo felicidade")
            return nil
        }
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        return refeicao
    }
    
   
    
}

