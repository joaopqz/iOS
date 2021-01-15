//
//  BaseViewController.swift
//  Mensagens
//
//  Created by Joao Queiroz on 14/01/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    @IBOutlet weak var lbMessage: UILabel!
    
    @IBAction func changeColor(_ sender: UIButton){
        if let reference = self as? ColorPickerDelegate{
            if #available(iOS 13.0, *) {
                       let colorPicker = storyboard?.instantiateViewController(identifier: "ColorPickerViewController") as! ColorPickerViewController
                       colorPicker.modalPresentationStyle = .overCurrentContext
                       colorPicker.delegate = reference
                       present(colorPicker, animated: true, completion: nil)
                   }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var message: Message!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
