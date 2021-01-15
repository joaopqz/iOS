//
//  ColorPickerViewController.swift
//  Mensagens
//
//  Created by Joao Queiroz on 14/01/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import UIKit

protocol ColorPickerDelegate: class {
    func applyColor(_ color: UIColor)
}

class ColorPickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    weak var delegate: ColorPickerDelegate?
    
    @IBOutlet weak var viColor: UIView!
    
    @IBOutlet weak var slRed: UISlider!
    
    @IBOutlet weak var slGreen: UISlider!
    
    @IBOutlet weak var slBlue: UISlider!
    
    @IBAction func chooseColor(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        delegate?.applyColor(viColor.backgroundColor ?? UIColor.black)
    }
    
    @IBAction func changeColor(_ sender: UISlider) {
        
        viColor.backgroundColor = UIColor(red: CGFloat(slRed.value), green: CGFloat(slGreen.value), blue: CGFloat(slBlue.value), alpha: 1.0)
    }
    
    
}
