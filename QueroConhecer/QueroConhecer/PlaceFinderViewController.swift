//
//  PlaceFinderViewController.swift
//  QueroConhecer
//
//  Created by Joao Queiroz on 19/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit
import MapKit

protocol PlaceFinderDelegate {
    func addPlace(_ place: Place)
}

class PlaceFinderViewController: UIViewController {
    
    enum PlaceFinderMessageType{
        case error(String)
        case confirmation(String)
        
    }
    
    @IBOutlet weak var tfCity: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var aiLoading: UIActivityIndicatorView!
    @IBOutlet weak var viewLoading: UIView!
    
    var place: Place!
    var delegate: PlaceFinderDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(getLocation(_:)))
        gesture.minimumPressDuration = 2.0
        mapView.addGestureRecognizer(gesture)
    }
    
    @objc func getLocation(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began{
            load(true)
            let point = gesture.location(in: mapView)
            let coordinate = mapView.convert(point, toCoordinateFrom: mapView)
            let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
                self.load(false)
                if error == nil{
                    if !self.savePlace(with: placemarks?.first){
                        self.showMessage(type: .error("Não foi possível localizar nenhum local com esse nome"))
                    }
                }
                else{
                        self.showMessage(type: .error("Erro desconhecido"))
                }
            }
        }
    }
    
    @IBAction func findCity(_ sender: UIButton) {
        
        tfCity.resignFirstResponder()
        let city = tfCity.text!
        load(true)
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(city) { (placeMarks, error) in
            self.load(false)
            if error == nil{
                if !self.savePlace(with: placeMarks?.first){
                    self.showMessage(type: .error("Não foi possível localizar nenhum local com esse nome"))
                }
            }
            else{
                    self.showMessage(type: .error("Erro desconhecido"))
            }
        }
    }
    
    func savePlace(with placemark: CLPlacemark?) -> Bool{
        guard let placemark = placemark, let coordinate = placemark.location?.coordinate else{return false}
        
        let name = placemark.name ?? placemark.country ?? "Desconhecido"
        let address = Place.getFormattedAddress(with: placemark)
        place = Place(name: name, latitude: coordinate.latitude, longitude: coordinate.longitude, address: address)
        
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 3500, longitudinalMeters: 3500)
        mapView.setRegion(region, animated: true)
        self.showMessage(type: .confirmation(place.name))
        
        return true
    }
    
    func showMessage(type: PlaceFinderMessageType){
        let title: String
        let message: String
        var hasConfirmation: Bool = false
        
        switch type {
        case .confirmation(let name):
            title = "Local encontrado"
            message = "Deseja adicionar \(name)"
            hasConfirmation = true
        case .error(let errorMessage):
            title = "Erro"
            message = errorMessage
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        if hasConfirmation{
            let confirmAction = UIAlertAction(title: "OK", style: .default) { (action) in
                self.delegate?.addPlace(self.place)
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(confirmAction)
        }
        present(alert,animated: true, completion: nil)
    }
    
    func load(_ show: Bool){
        viewLoading.isHidden = !show
        if show{
            aiLoading.startAnimating()
        }else{
            aiLoading.stopAnimating()
        }
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
