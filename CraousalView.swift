//
//  CraousalView.swift
//  SlotGame
//
//  Created by Sachin on 19/02/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit

class CraousalView: UIView {

    var label: UILabel = UILabel()
    let myNames = ["Dragons and Dungeons","Sports of Risk","War Air","Felines","Space","Japanese","Luxury Cars","Motorcycle","Martial Arts","Ninja"]
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addCustomView(index : Int, viewFrame : CGRect, isStage : Bool, iconName: String) {
        
        var backGroundView: UIImageView
        backGroundView = UIImageView(frame: viewFrame)
        backGroundView.backgroundColor = UIColor(red: 177/255, green: 83/255, blue: 20/255, alpha: 6.0)
        backGroundView.layer.borderWidth = 1
        backGroundView.layer.borderColor = UIColor.white.cgColor
        self.addSubview(backGroundView)
        
        var itemView: UIImageView
        itemView = UIImageView(frame: viewFrame)
        let iconName = String.init(format: "%@%d",iconName ,index+1)
        itemView.image = UIImage(named: iconName)
        itemView.contentMode = .scaleAspectFit
        self.addSubview(itemView)
        
        
        var lockView: UIImageView
        lockView = UIImageView(frame: CGRect(x: 10, y: 50, width: 100, height: 100))
       // let lockIcon = String.init(format: "%@%d",iconName ,index+1)
        lockView.image =  #imageLiteral(resourceName: "lockicon")
        lockView.contentMode = .scaleAspectFit
        self.addSubview(lockView)
       
        
        if index == 0{
            lockView.isHidden =  true
        }
        if index == 1 && Scoring.sharedGameData.winningPoints > 15001{
            lockView.isHidden =  true
        }
        if index == 2 && Scoring.sharedGameData.winningPoints > 320001{
            lockView.isHidden =  true
        }
        if index == 3 && Scoring.sharedGameData.winningPoints > 3120000{
            lockView.isHidden =  true
        }
        
        
        
        
//        label.frame = CGRect(x:0,y: -50,width: 300,height: 70)
//        label.backgroundColor=UIColor.clear
//        label.textColor=UIColor.white
//        label.tag = index
//        label.font = UIFont.boldSystemFont(ofSize: 25)
//        label.textAlignment = NSTextAlignment.center
//        label.text = myNames[index]
//        self.addSubview(label)
//        
//        if isStage == true {
//            label.isHidden = true
//        }
        
        
//        var btn: UIButton = UIButton()
//        btn.frame=CGRectMake(50, 120, 200, 100)
//        btn.backgroundColor=UIColor.redColor()
//        btn.setTitle("button", forState: UIControlState.Normal)
//        btn.addTarget(self, action: "changeLabel", forControlEvents: UIControlEvents.TouchUpInside)
//        self.addSubview(btn)
        
        
    }
}
