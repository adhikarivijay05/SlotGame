//
//  TermsAndConditionVC.swift
//  SlotGame
//
//  Created by Nitin Chauhan on 26/02/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit

class TermsAndConditionVC: UIViewController {

    @IBOutlet weak var acceptBtn: UIButton!
    @IBOutlet weak var declineButton: UIButton!
    @IBOutlet weak var mailBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       setUpAPi()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setUpAPi() {
        
        
        acceptBtn.layer.borderWidth = 1
        acceptBtn.layer.borderColor = UIColor.white.cgColor
        
        declineButton.layer.borderWidth = 1
        declineButton.layer.borderColor = UIColor.white.cgColor
        
        mailBtn.layer.borderWidth = 1
        mailBtn.layer.borderColor = UIColor.white.cgColor
        
        
    }
    @IBAction func closebuttonClicked(_ sender: Any) {
        
      // self.view .removeFromSuperview()
        
       self.navigationController?.popViewController(animated: false)
    }
    @IBAction func acceptBtnClicked(_ sender: Any) {
      //  self.dismiss(animated: true, completion: nil)
     
        let homeViewObj = HomeViewController.init(nibName: "HomeViewController", bundle: nil)
        homeViewObj.loginStatus = "1"
      //  Utility.setUserid("1")
        self.navigationController?.pushViewController(homeViewObj, animated: true)
    }
    @IBAction func mailMeBtnClicked(_ sender: Any) {
    }

    @IBAction func declineBtn(_ sender: Any) {
    }
    

}
