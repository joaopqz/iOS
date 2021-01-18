//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by Joao Queiroz on 18/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var swAutoRefresh: UISwitch!
    @IBOutlet weak var lbTimeInterval: UILabel!
    @IBOutlet weak var slTimeInterval: UISlider!
    
    @IBOutlet weak var scColorScheme: UISegmentedControl!
    
    let settings = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) { (notification) in
            self.formatView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        formatView()
    }
    
    func formatView(){
        swAutoRefresh.setOn(settings.autoRefresh, animated: false)
        slTimeInterval.setValue(Float(settings.timeInterval), animated: false)
        scColorScheme.selectedSegmentIndex = settings.colorScheme
        changeTimeIntervalLabel(with: settings.timeInterval)
    }
    
    func changeTimeIntervalLabel(with value:Double){
        lbTimeInterval.text = "Mudar após \(Int(value)) segundos"
    }
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        settings.autoRefresh = sender.isOn
    }
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(round(sender.value))
        changeTimeIntervalLabel(with: value)
        settings.timeInterval = value
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        settings.colorScheme = sender.selectedSegmentIndex
    }
    
}
