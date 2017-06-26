//
//  MapView.swift
//  SlotGame
//
//  Created by Nitin Chauhan on 13/04/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit

class MapView: UIView {

    var label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addCustomView(index : Int, viewFrame : CGRect, isStage : Bool, iconName: String) {

        var backGroundView: UIImageView
        backGroundView = UIImageView(frame: viewFrame)
        backGroundView.backgroundColor = UIColor.clear //(red: 177/255, green: 83/255, blue: 20/255, alpha: 6.0)
        backGroundView.layer.borderWidth = 1
        backGroundView.layer.borderColor = UIColor.clear.cgColor
        self.addSubview(backGroundView)
        
        var itemView: UIImageView
        itemView = UIImageView(frame: viewFrame)
        let iconName = String.init(format: "%@%d",iconName ,index+1)
        itemView.image = UIImage(named: iconName)
        itemView.contentMode = .scaleAspectFit
        self.addSubview(itemView)
        
        
        /*
        for 0 in 9 {
            var btn: UIButton = UIButton()
            btn.frame=CGRectMake(50, 120, 200, 100)
            btn.backgroundColor=UIColor.redColor()
            btn.setTitle("button", forState: UIControlState.Normal)
            btn.addTarget(self, action: "changeLabel", forControlEvents: UIControlEvents.TouchUpInside)
            self.addSubview(btn)
        }
        */
        
//        label.frame = CGRect(x:0,y: -50,width: 300,height: 70)
//        label.backgroundColor=UIColor.clear
//        label.textColor=UIColor.white
//        label.tag = index
//        label.font = UIFont.boldSystemFont(ofSize: 25)
//        label.textAlignment = NSTextAlignment.center
//        label.text = myNames[index]
//        self.addSubview(label)
        
        if isStage == true {
            label.isHidden = true
        }
        
        
        //        var btn: UIButton = UIButton()
        //        btn.frame=CGRectMake(50, 120, 200, 100)
        //        btn.backgroundColor=UIColor.redColor()
        //        btn.setTitle("button", forState: UIControlState.Normal)
        //        btn.addTarget(self, action: "changeLabel", forControlEvents: UIControlEvents.TouchUpInside)
        //        self.addSubview(btn)
        
        
    }

}
