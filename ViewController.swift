//
//  ViewController.swift
//  SlotGame
//
//  Created by Nitin Singh on 16/02/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit

import FBSDKLoginKit

import Social




class ViewController: UIViewController {

    @IBOutlet var socailView: UIView!
    @IBOutlet var loginView: UIView!
    @IBOutlet var registerView: UIView!
    @IBOutlet var facebookBtn: UIButton!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var usernameText: UITextField!
    @IBOutlet var registerBtn: UIButton!
    @IBOutlet var loginBtn: UIButton!
    
    
    
    @IBOutlet var signUpUserName: UITextField!
    @IBOutlet var signUpEmail: UITextField!
    @IBOutlet var signUpPhone: UITextField!
    @IBOutlet var signUpPassword: UITextField!
    @IBOutlet var signUpBtn: UIButton!
    @IBOutlet var signUpSocialView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        setUpAPi()
        setUpRegister()
    }
    func setUpAPi() {
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        
        loginView.layer.borderWidth = 1
        loginView.layer.borderColor = UIColor.lightGray.cgColor
        
        usernameText.layer.borderWidth = 1
        usernameText.layer.borderColor = UIColor.white.cgColor
        
        passwordText.layer.borderWidth = 1
        passwordText.layer.borderColor = UIColor.white.cgColor
        
        registerBtn.layer.borderWidth = 1
        registerBtn.layer.borderColor = UIColor.white.cgColor
        
        loginBtn.layer.borderWidth = 1
        loginBtn.layer.borderColor = UIColor.white.cgColor
        
        signInButton.layer.borderWidth = 1
        signInButton.layer.borderColor = UIColor.white.cgColor
        
        
        socailView.layer.cornerRadius = 20
        
    }
    
    func setUpRegister() {
        signUpUserName.layer.borderWidth = 1
        signUpUserName.layer.borderColor = UIColor.white.cgColor
        
        signUpEmail.layer.borderWidth = 1
        signUpEmail.layer.borderColor = UIColor.white.cgColor
        
        signUpPhone.layer.borderWidth = 1
        signUpPhone.layer.borderColor = UIColor.white.cgColor
        
        signUpPassword.layer.borderWidth = 1
        signUpPassword.layer.borderColor = UIColor.white.cgColor
        
        signUpBtn.layer.borderWidth = 1
        signUpBtn.layer.borderColor = UIColor.white.cgColor
        
        signUpSocialView.layer.cornerRadius = 20
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func forgotPasswordClicked(_ sender: Any) {
        let homeViewObj = ForgotViewController.init(nibName: "ForgotViewController", bundle: nil)
        self.navigationController?.pushViewController(homeViewObj, animated: true)
        
    }
    @IBAction func registerBtnPressed(_ sender: Any) {
        registerBtn.backgroundColor = UIColor(red: 106/255, green: 25/255, blue: 7/255, alpha: 1.0)
        loginBtn.backgroundColor = UIColor.clear //UIColor(red: 177/255, green: 83/255, blue: 20/255, alpha: 1.0)
        loginView.isHidden = true
        registerView.isHidden = false
    }
    @IBAction func loginBtnClicked(_ sender: Any) {
        
        loginBtn.backgroundColor = UIColor(red: 106/255, green: 25/255, blue: 7/255, alpha: 1.0)
        registerBtn.backgroundColor = UIColor.clear//UIColor(red: 177/255, green: 83/255, blue: 20/255, alpha: 1.0)
        loginView.isHidden = false
        registerView.isHidden = true
    }
    
    @IBAction func cancelBtnClicked(_ sender: Any) {
        
        
        let homeViewObj = HomeViewController.init(nibName: "HomeViewController", bundle: nil)
        homeViewObj.loginStatus = "2"
        //  Utility.setUserid("1")
        self.navigationController?.pushViewController(homeViewObj, animated: false)
    }
    

    @IBAction func signinButtonClicked(_ sender: Any) {
       
        if !isValidate() {
            return
        }
        
      signBtnClicked(userName: usernameText.text!, password: passwordText.text!)
        
    }
    
    func signBtnClicked(userName : String, password : String)
    {
        var request = URLRequest(url: URL(string: "http://dnddemo.com/slot_app/v1/userlogin")!)
        request.httpMethod = "POST"
        // let postString = "email=ompal.hitm09@gmail.com&password=12345"
        let postString = String(format : "email=%@&password=%@",userName, password)
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                self.showAlertWithText(header: "Alert", message: error as! String)
                
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    DispatchQueue.main.async {
                        let errorValue = json["error"] as? Int
                        if errorValue == 1
                        {
                            self.showAlertWithText(header: "Alert", message: json["message"] as! String)
                        }
                        Utility.setUserRole(json["id"] as! String)
                        
                        
                        
                        let homeViewObj = TermsAndConditionVC.init(nibName: "TermsAndConditionVC", bundle: nil)
                        self.navigationController?.pushViewController(homeViewObj, animated: false)
                    }
                    
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
    
    
    func isValidate() -> Bool {
        
        if  usernameText.text == "" || passwordText.text == ""{
            showAlertWithText(header: "Alert", message: "Please fill Username/Password")
            return false
        }
        return true
    }
    func showAlertWithText(header: String, message: String){
        let alert = UIAlertController(title: header, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func isValidateSignUp() -> Bool {
        
        if  signUpUserName.text == "" || signUpPassword.text == "" || signUpPhone.text == "" || signUpEmail.text == "" {
            showAlertWithText(header: "Alert", message: "Please fill all fields")
            return false
        }
        return true
    }
    @IBAction func SignUPBtnClicked(_ sender: Any) {
        
        if !isValidateSignUp() {
            return
        }
        
        var request = URLRequest(url: URL(string: "http://dnddemo.com/slot_app/v1/createUser")!)
        request.httpMethod = "POST"
        let postString = String(format : "username=%@&password=%@&email=%@&phone_no=%@&postal_code=%@",signUpUserName.text!, signUpPassword.text!,signUpEmail.text!,signUpPhone.text!,"634505")
       
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                self.showAlertWithText(header: "Alert", message: error as! String)
                
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    DispatchQueue.main.async {
                       self.showAlertWithText(header: "Alert", message: json["message"] as! String)
                    }
                    
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
        
        
        
    }
    @IBAction func facebookBtnClicked(_ sender: Any) {
//        let homeViewObj = TermsAndConditionVC.init(nibName: "TermsAndConditionVC", bundle: nil)
//        self.navigationController?.pushViewController(homeViewObj, animated: false)
        
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getFBUserData()
                }
            }
        }
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    //everything works print the user data
                    print(result)
                    
                    var email = ""
                    if let responseDictionary = result as? NSDictionary {
                         email = (responseDictionary["email"] as? String)!
                        print(email)
                        let first = responseDictionary["name"] as? String
                        print(first)
                        if let picture = responseDictionary["picture"] as? NSDictionary {
                            if let data = picture["data"] as? NSDictionary{
                                if let profilePicture = data["url"] as? String {
                                    print(profilePicture)
                                }
                            }
                        }
                    }
                    
                    
                    self.signBtnClicked(userName: email, password: "123456")

                }
            })
        }
    }
    @IBAction func googlePlusBtn(_ sender: Any) {
        
//        let vc = SLComposeViewController(forServiceType:SLServiceTypeFacebook)
//        vc?.add(URL(string: "http://www.slotMachine.com/"))
//        vc?.setInitialText("This is slotMachine.")
//        self.present(vc!, animated: true, completion: nil)
       }

}
