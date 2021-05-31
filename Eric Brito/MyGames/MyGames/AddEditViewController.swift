//
//  AddEditViewController.swift
//  MyGames
//
//  Created by Joao Queiroz on 21/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit
import CoreData
import Photos

class AddEditViewController: UIViewController {
    
    
    @IBOutlet weak var tfTitle: UITextField!
    
    @IBOutlet weak var tfConsole: UITextField!
    
    @IBOutlet weak var dpRelease: UIDatePicker!
    
    @IBOutlet weak var btAddEdit: UIButton!
    
    @IBOutlet weak var btCover: UIButton!
    
    @IBOutlet weak var ivCover: UIImageView!
    
    var game: Game!
    lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = .white
        return pickerView
    }()
    var consolesManager = ConsolesManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        consolePicker()
        checkGame()
    }
    
    func checkGame(){
        if game != nil{
            title = "Editar jogo"
            btAddEdit.setTitle("ALTERAR", for: .normal)
            tfTitle.text = game.title
            if let console = game.console, let index = consolesManager.consoles.firstIndex(of: console){
                tfConsole.text = console.name
                pickerView.selectRow(index, inComponent: 0, animated: false)
            }
            ivCover.image = game.cover as? UIImage
            if let release = game.releaseDate{
                dpRelease.date = release
            }
            if game.cover != nil {
                btCover.setTitle(nil, for: .normal)
            }
        }
    }
    
    func consolePicker(){
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        toolbar.tintColor = UIColor(named: "main")
        
        let btCancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        let btDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        let btFlexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.items = [btCancel, btFlexibleSpace,btDone]
        
        tfConsole.inputView = pickerView
        tfConsole.inputAccessoryView = toolbar
    }
    
    @objc func cancel(){
        tfConsole.resignFirstResponder()
    }
    
    @objc func done(){
        
        tfConsole.text = consolesManager.consoles[pickerView.selectedRow(inComponent: 0)].name
        
        cancel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        consolesManager.loadConsoles(with: context)
    }

    @IBAction func addEditCover(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.navigationBar.tintColor = UIColor(named: "main")
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addEditGame(_ sender: UIButton) {
        if game == nil{
            game = Game(context: context)
        }
        game.title = tfTitle.text
        game.releaseDate = dpRelease.date
        
        if !tfConsole.text!.isEmpty{
            game.console = consolesManager.consoles[pickerView.selectedRow(inComponent: 0)]
        }
        
        game.cover = ivCover.image
        
        do{
            try context.save()
        } catch{
            print(error.localizedDescription)
        }
        navigationController?.popViewController(animated: true)
    }
    
}

extension AddEditViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return consolesManager.consoles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return consolesManager.consoles[row].name
    }
}

extension AddEditViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
        let image = info[.originalImage] as? UIImage
        self.ivCover.image = image
        self.btCover.setTitle(nil, for: .normal)
        picker.dismiss(animated: true, completion: nil)
        
    }
    
}
