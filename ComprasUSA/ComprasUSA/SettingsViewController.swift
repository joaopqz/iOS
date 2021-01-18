//
//  SettingsViewController.swift
//  ComprasUSA
//
//  Created by Joao Queiroz on 15/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var tfDolar: UITextField!
    
    @IBOutlet weak var tfIOF: UITextField!
    
    @IBOutlet weak var tfStateTaxes: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tfDolar.text = tc.getFormattedValue(of: tc.dollar, withCurrency: "")
        tfIOF.text = tc.getFormattedValue(of: tc.iof, withCurrency: "")
        tfStateTaxes.text = tc.getFormattedValue(of: tc.stateTax, withCurrency: "")
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setValues(){
        tc.dollar = tc.convertToDouble(tfDolar.text!)
        tc.iof = tc.convertToDouble(tfIOF.text!)
        tc.stateTax = tc.convertToDouble(tfStateTaxes.text!)
    }
}

extension SettingsViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        setValues()
    }
}
