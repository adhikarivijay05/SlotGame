//
//  TicketViewController.swift
//  SlotGame
//
//  Created by Nivesh on 23/05/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit

class TicketViewController: UIViewController {

    @IBOutlet var lotterylabel: UILabel!
    @IBOutlet var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        lotterylabel.layer.borderWidth = 1
        lotterylabel.layer.borderColor = UIColor.white.cgColor
        lotterylabel.layer.cornerRadius = 10
        
        lotterylabel.text = "999.999.9999"
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
        
    }

}
