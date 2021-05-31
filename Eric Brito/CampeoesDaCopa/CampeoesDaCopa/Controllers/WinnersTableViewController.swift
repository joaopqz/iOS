//
//  WinnersTableViewController.swift
//  CampeoesDaCopa
//
//  Created by Joao Queiroz on 18/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class WinnersTableViewController: UITableViewController {
    
    var worldCups: [WorldCup] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWorldCups()
    }
    
    func loadWorldCups(){
        let fileURL = Bundle.main.url(forResource: "winners.json", withExtension: nil)!
        
        let jsonData = try! Data(contentsOf: fileURL)
        do{
            worldCups = try JSONDecoder().decode([WorldCup].self, from: jsonData)
        } catch{
            print(error.localizedDescription)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! WorldCupViewController
        let worldCup = worldCups[tableView.indexPathForSelectedRow!.row]
        vc.worldCup = worldCup
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return worldCups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WorldCupTableTableViewCell
        cell.prepare(with: worldCups[indexPath.row])
        
        
        return cell
    }
    

    

}
