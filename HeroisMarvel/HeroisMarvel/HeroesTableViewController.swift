//
//  HeroesTableViewController.swift
//  HeroisMarvel
//
//  Created by Eric Brito on 22/10/17.
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit

class HeroesTableViewController: UITableViewController {
    
    var name: String?
    var heroes: [Hero] = []
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    var loadingHeroes = false
    var currentPage = 0
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Buscando heróis. Aguarde..."
        loadHero()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func loadHero(){
        loadingHeroes = true
        MarvelAPI.loadHeroes(name: name, page: currentPage) { (info) in
            if let info = info{
                self.heroes += info.data.results
                self.total = info.data.total
            }
            DispatchQueue.main.async {
                self.loadingHeroes = false
                self.label.text = "Não foram encontrados heróis com o nome \(self.name!)"
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc =  segue.destination as! HeroViewController
        vc.hero = heroes[tableView.indexPathForSelectedRow!.row]
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = (heroes.count == 0) ? label : nil
        return heroes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroTableViewCell
        
        let hero = heroes[indexPath.row]
        cell.prepareCell(with: hero)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == heroes.count - 15 && loadingHeroes{
            currentPage += 1
            loadHero()
        }
    }

}
