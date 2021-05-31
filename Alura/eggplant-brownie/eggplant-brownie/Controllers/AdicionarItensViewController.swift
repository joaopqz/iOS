//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Joao Queiroz on 08/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item:Item)
}

class AdicionarItensViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    //MARK: - Atributos
    
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate){
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: - IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        
        guard let nome = nomeTextField.text, let caloria = caloriasTextField.text else{return}
        guard let calorias = Double(caloria) else{return}
        
        let item = Item(nome: nome, calorias: calorias)
        delegate?.add(item)
        
        navigationController?.popViewController(animated: true)
    }
}
