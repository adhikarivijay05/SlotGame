//
//  ForgotViewController.swift
//  SlotGame
//
//  Created by Nitin Chauhan on 26/02/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit

class ForgotViewController: UIViewController {

    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!

    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var emailText: UITextField!
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
        
        
        phoneText.layer.borderWidth = 1
        phoneText.layer.borderColor = UIColor.white.cgColor
        
        emailText.layer.borderWidth = 1
        emailText.layer.borderColor = UIColor.white.cgColor
        
        sendBtn.layer.borderWidth = 1
        sendBtn.layer.borderColor = UIColor.white.cgColor
        
        backBtn.layer.borderWidth = 1
        backBtn.layer.borderColor = UIColor.white.cgColor
    
    }
    @IBAction func sendOtpClicked(_ sender: Any) {
        
    }

    @IBAction func backToLogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
