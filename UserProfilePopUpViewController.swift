//
//  UserProfilePopUpViewController.swift
//  SlotGame
//
//  Created by Nivesh on 13/06/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit

class UserProfilePopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
        
    }
    
    @IBAction func termsButton(_ sender: Any) {
        
        let termsVC = TermsAndConditionVC.init(nibName: "TermsAndConditionVC", bundle: nil)
        self.navigationController?.pushViewController(termsVC, animated: false)

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
