//
//  GamesTableViewCell.swift
//  CampeoesDaCopa
//
//  Created by Joao Queiroz on 19/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class GamesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var ivHome: UIImageView!
    @IBOutlet weak var ivAway: UIImageView!
    @IBOutlet weak var lbHome: UILabel!
    @IBOutlet weak var lbAway: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    func prepare(with game: Game) {
        ivHome.image = UIImage(named: "\(game.home).png")
        ivAway.image = UIImage(named: "\(game.away).png")
        lbAway.text = game.away
        lbHome.text = game.home
        lbScore.text = "\(game.score)"
    }

}
