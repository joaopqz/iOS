//
//  ViewController.swift
//  ComprasUSA
//
//  Created by Joao Queiroz on 15/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {

    @IBOutlet weak var tfDolar: UITextField!
    
    @IBOutlet weak var lbRealDescription: UILabel!
    
    @IBOutlet weak var lbReal: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAmmount()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        setAmmount()
    }
    
    func setAmmount(){
        tc.shoppingValue = tc.convertToDouble(tfDolar.text!)
        lbReal.text = tc.getFormattedValue(of: tc.shoppingValue * tc.dollar, withCurrency: "")
        
        let dolar = tc.getFormattedValue(of: tc.dollar, withCurrency: "R$ ")
        lbRealDescription.text = "Valor sem impostos (dólar \(dolar))"
    }


}

