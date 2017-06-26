//
//  OffersTableViewCell.swift
//  SlotGame
//
//  Created by Nitin Chauhan on 18/05/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit

class OffersTableViewCell: UITableViewCell {

    @IBOutlet var firstContainer: UIView!
    @IBOutlet var secondContainer: UIView!
    @IBOutlet var thirdContainer: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        firstContainer.layer.borderWidth = 1
        firstContainer.layer.borderColor = UIColor.white.cgColor
        firstContainer.layer.cornerRadius = 10
        
        secondContainer.layer.borderWidth = 1
        secondContainer.layer.borderColor = UIColor.white.cgColor
        secondContainer.layer.cornerRadius = 10
        
        thirdContainer.layer.borderWidth = 1
        thirdContainer.layer.borderColor = UIColor.white.cgColor
        thirdContainer.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
