//
//  ViewController.swift
//  TrailerFlix
//
//  Created by Joao Queiroz on 22/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var trailers: [Trailer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTrailer()
    }

    @IBAction func watchRandomTrailer(_ sender: UIButton) {
        let randomIndex = Int(arc4random_uniform(UInt32(trailers.count)))
        showTrailer(index: randomIndex)
    }
    
    func showTrailer(index: Int){
        let trailer = trailers[index]
        performSegue(withIdentifier: "trailerSegue", sender: trailer)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! TrailerViewController
        vc.trailer = sender as? Trailer
    }
    
    func loadTrailer(){
        guard let url = Bundle.main.url(forResource: "trailers", withExtension: "json") else{ return}
        do {
            let trailersData = try Data(contentsOf: url)
            trailers = try JSONDecoder().decode([Trailer].self, from: trailersData)
            tableView.reloadData()
            
        } catch  {
            print(error.localizedDescription)
        }
    }
    
}

//MARK: - Extensions

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trailers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let trailer = trailers[indexPath.row]
        cell.textLabel?.text = trailer.title
        cell.detailTextLabel?.text = "\(trailer.year)"
        cell.imageView?.image = UIImage(named: "\(trailer.poster)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showTrailer(index: indexPath.row)
    }
}
