//
//  FinalViewController.swift
//  FotoRoid
//
//  Created by Joao Queiroz on 22/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit
import Photos

class FinalViewController: UIViewController {
    
    @IBOutlet weak var ivPhoto: UIImageView!
    
    var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        ivPhoto.image = image
        ivPhoto.layer.borderWidth = 10
        ivPhoto.layer.borderColor = UIColor.white.cgColor
    }

    func saveToAlbum(){
        PHPhotoLibrary.shared().performChanges({
            
            let creationRequest = PHAssetChangeRequest.creationRequestForAsset(from: self.image)
            let addAssetRequest = PHAssetCollectionChangeRequest()
            addAssetRequest.addAssets([creationRequest.placeholderForCreatedAsset] as NSArray)
            
        }) { (success, error) in
            if !success{
                print(error)
            } else{
                let alerta = UIAlertController(title: "Sucesso", message: "Sua foto foi salva no álbum de fotos com sucesso.", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alerta.addAction(okAction)
                self.present(alerta, animated: true, completion: nil)
            }
        }
    }
    
    func alerta(){
        let alerta = UIAlertController(title: "ERRO", message: "Você precisa autorizar o acesso ao álbum para poder salvar sua foto.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alerta.addAction(okAction)
        present(alerta, animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIButton) {
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status{
            case .authorized:
                self.saveToAlbum()
            default:
                self.alerta()
            }
        }
    }
    
    
    @IBAction func restart(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    

}
