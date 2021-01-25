//
//  ViewController.swift
//  FotoRoid
//
//  Created by Joao Queiroz on 22/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          navigationController?.setNavigationBarHidden(true, animated: true)
      }
    
    @IBAction func selectSource(_ sender: UIButton){
        let alert = UIAlertController(title: "Selecionar foto", message: "De onde você quer escolher a sua foto?", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Câmera", style: .default) { (action) in
                self.selectPicture(sourceType: .camera)
            }
            alert.addAction(cameraAction)
        }
        
        let libraryAction = UIAlertAction(title: "Biblioteca de fotos", style: .default) { (action) in
            self.selectPicture(sourceType: .photoLibrary)
        }
        alert.addAction(libraryAction)
        
        let photosAction = UIAlertAction(title: "Álbum de fotos", style: .default) { (action) in
            self.selectPicture(sourceType: .savedPhotosAlbum)
        }
        alert.addAction(photosAction)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func selectPicture(sourceType: UIImagePickerController.SourceType){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! EffectsViewController
        if let image = sender as? UIImage{
            vc.image = image
        } else{
           dismiss(animated: true, completion: nil)
        }
        
    }
}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //É disparado quando o usuário selecionou um arquivo de media
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            
            //REDUZ O TAMANHO DA IMAGEM
            let originalWidth = image.size.width
            let aspectRatio = originalWidth / image.size.height
            var smallSize:CGSize
            
            //SE FOR MAIOR QUE 1 A IMAGEM ESTÁ EM LANDSCAPE, SE MENOR EM PORTRAIT
            if aspectRatio > 1{
                smallSize = CGSize(width: 1000, height: 1000/aspectRatio)
            }else{
                smallSize = CGSize(width: 1000*aspectRatio, height: 1000)
            }
            
            //CRIA UMA AREA PARA TRABALHAR A IMAGEM
            UIGraphicsBeginImageContext(smallSize)
            image.draw(in: CGRect(x: 0, y: 0, width: smallSize.width, height: smallSize.height))
            let smallImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            
            //FECHA A TELA ATUAL E ABRE A TELA DE EFEITOS
            dismiss(animated: true) {
                self.performSegue(withIdentifier: "effectsSegue", sender: smallImage)
            }
        }
    }
}
