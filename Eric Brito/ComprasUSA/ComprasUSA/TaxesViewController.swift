//
//  TaxesViewController.swift
//  ComprasUSA
//
//  Created by Joao Queiroz on 15/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class TaxesViewController: UIViewController {
    
    
    @IBOutlet weak var lbDollar: UILabel!
    @IBOutlet weak var lbStateTaxesDescription: UILabel!
    @IBOutlet weak var lbStateTaxes: UILabel!
    @IBOutlet weak var lbIOFDescription: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBOutlet weak var lbReal: UILabel!
    
    
    @IBAction func swAction(_ sender: Any) {
        calculateTaxes()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTaxes()
    }
    
    func calculateTaxes(){
        lbStateTaxesDescription.text = "Imposto do Estado (\(tc.getFormattedValue(of: tc.stateTax, withCurrency: "")))"
        lbIOFDescription.text = "IOF (\(tc.getFormattedValue(of: tc.iof, withCurrency: "")))"
        lbDollar.text = tc.getFormattedValue(of: tc.shoppingValue, withCurrency: "U$ ")
        lbStateTaxes.text = tc.getFormattedValue(of: tc.stateTaxValue, withCurrency: "U$ ")
        lbIOF.text = swCreditCard.isOn ? tc.getFormattedValue(of: tc.iofValue, withCurrency: "U$ ") : tc.getFormattedValue(of: 0, withCurrency: "U$ ")
        
        lbReal.text = tc.getFormattedValue(of: tc.calculate(useCreditCard: swCreditCard.isOn)*tc.dollar, withCurrency: "R$ ")
    }

}
