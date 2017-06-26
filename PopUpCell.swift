//
//  PopUpCell.swift
//  SlotGame
//
//  Created by Nitin Chauhan on 11/04/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit

class PopUpCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var timerBtn:UIButton?
    @IBOutlet weak var nameImg:UIImageView!
    @IBOutlet weak var switchBtn:UISwitch!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
