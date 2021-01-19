//
//  WorldCupTableTableViewCell.swift
//  CampeoesDaCopa
//
//  Created by Joao Queiroz on 19/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import UIKit

class WorldCupTableTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lbYear: UILabel!
    @IBOutlet weak var ivWinner: UIImageView!
    @IBOutlet weak var ivVice: UIImageView!
    @IBOutlet weak var lbWinner: UILabel!
    @IBOutlet weak var lbLooser: UILabel!
    @IBOutlet weak var lbWinnerScore: UILabel!
    @IBOutlet weak var lbLooserScore: UILabel!
    @IBOutlet weak var lbCountry: UILabel!
    
    func prepare(with cup: WorldCup){
        lbYear.text = "\(cup.year)"
        ivWinner.image = UIImage(named: cup.winner)
        ivVice.image = UIImage(named: cup.vice)
        lbWinner.text = cup.winner
        lbLooser.text = cup.vice
        lbCountry.text = cup.country
        lbWinnerScore.text = cup.winnerScore
        lbLooserScore.text = cup.viceScore
    }

}


