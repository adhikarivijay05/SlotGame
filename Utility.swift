//
//  Utility.swift
//  SlotGame
//
//  Created by Nitin Chauhan on 16/03/17.
//  Copyright © 2017 CC. All rights reserved.
//

import Foundation
import PopupDialog

class Utility: NSObject {
    
    var credits = 0
    static let sharedData = Utility()
    
    class func setUserRole(_ UserID: String)->(){
        UserDefaults.standard.set(UserID, forKey: "UserRole")
    }
    
    class func getUserRole()->(String?){
        return UserDefaults.standard.value(forKey: "UserRole") as? String
    }
    
    
    class func setOpenLevel(userid : Int) {
        UserDefaults.standard.set(userid, forKey: "OPENLEVEL") //setObject
        
    }
    
    class  func getOpenLevel(userid : Int) {
        UserDefaults.standard.string(forKey: "OPENLEVEL")
        
    }
    
    public func popUpAlert(title : String , message : String, cancelButton : String , defaultButton : String, ref : UIViewController) {
        
    
        // Customize dialog appearance
        let pv = PopupDialogDefaultView.appearance()
        pv.titleFont    = UIFont(name: "HelveticaNeue-Light", size: 20)!
        pv.titleColor   = UIColor.white
        pv.messageFont  = UIFont(name: "HelveticaNeue", size: 16)!
        pv.messageColor = UIColor(white: 0.8, alpha: 1)
        
        // Customize the container view appearance
        let pcv = PopupDialogContainerView.appearance()
        pcv.backgroundColor = UIColor(red:233/255, green:150/255, blue:38/255, alpha:1.00)
        pcv.cornerRadius    = 10
        pcv.shadowEnabled   = true
        pcv.shadowColor     = UIColor.black
        
        // Customize overlay appearance
        let ov = PopupDialogOverlayView.appearance()
        ov.blurEnabled = true
        ov.blurRadius  = 30
        ov.liveBlur    = true
        ov.opacity     = 0.7
        ov.color       = UIColor.black
        
        // Customize default button appearance
        let db = DefaultButton.appearance()
        db.titleFont      = UIFont(name: "HelveticaNeue-Medium", size: 14)!
        db.titleColor     = UIColor.white
        db.buttonColor    = UIColor(red:225/255, green:87/255, blue:41/255, alpha:1.00)
        db.separatorColor = UIColor(red:0.20, green:0.20, blue:0.25, alpha:1.00)
        
        // Customize cancel button appearance
        let cb = CancelButton.appearance()
        cb.titleFont      = UIFont(name: "HelveticaNeue-Medium", size: 14)!
        cb.titleColor     = UIColor(white: 0.6, alpha: 1)
        cb.buttonColor    = UIColor(red:255/255, green:87/255, blue:41/255, alpha:1.00)
        cb.separatorColor = UIColor(red:0.20, green:0.20, blue:0.25, alpha:1.00)
        
        
        
        let title = title
        let message = message
       // let image = UIImage(named: "pexels-photo-103290")
        
        // Create the dialog
        let popup = PopupDialog(title: title, message: message)
        
        // Create buttons
        let buttonOne = CancelButton(title: cancelButton) {
            print("You canceled the car dialog.")
        }
        
        
//        let buttonTwo = DefaultButton(title: defaultButton) {
//            print("What a beauty!")
//        }
//        
        
        
        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne])
        
        // Present dialog
        ref.present(popup, animated: true, completion: nil)
    }
    
    
    
}

