//
//  ViewController+CoreData.swift
//  MyGames
//
//  Created by Joao Queiroz on 21/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension UIViewController{
    var context: NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
