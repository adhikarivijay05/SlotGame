//
//  LineView.swift
//  SlotGame
//
//  Created by Nivesh on 07/06/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit

class LineView : UIView {
    
    var numberOfLines = 0;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, lines: Int) {
        self.init(frame: frame)
        numberOfLines = lines + 1
        self.backgroundColor = UIColor.init(white: 0.0, alpha: 0.0)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext() {
            
            context.setStrokeColor(colorOfView().cgColor)
            context.setLineWidth(2)
            context.beginPath()
            let width = Int(self.frame.width)
            let height = Int(self.frame.height)

            switch numberOfLines {
            case 1:
                context.setStrokeColor(colorOfView().cgColor)
                context.move(to: CGPoint(x: 30, y: 200))
                context.addLine(to: CGPoint(x: width - 50, y: 200))
                context.strokePath()

            case 2:
                context.setStrokeColor(colorOfView().cgColor)
                context.move(to: CGPoint(x: 30, y: 200))
                context.addLine(to: CGPoint(x: width - 50, y: 200))
                context.strokePath()

                context.setStrokeColor(colorOfView().cgColor)
                
                context.move(to: CGPoint(x: 30, y: 300))
                context.addLine(to: CGPoint(x: width - 50, y: 300))
                context.strokePath()
                
            case 3:
                context.setStrokeColor(colorOfView().cgColor)
                context.move(to: CGPoint(x: 30, y: 200))
                context.addLine(to: CGPoint(x: width - 50, y: 200))
                context.strokePath()
                
                context.setStrokeColor(colorOfView().cgColor)
                context.move(to: CGPoint(x: 30, y: 300))
                context.addLine(to: CGPoint(x: width - 50, y: 300))
                context.strokePath()
                
                context.setStrokeColor(colorOfView().cgColor)
                context.move(to: CGPoint(x: 30, y: 100))
                context.addLine(to: CGPoint(x: width - 50, y: 100))
                context.strokePath()
                
                
            case 4:
                context.setStrokeColor(colorOfView().cgColor)
                context.move(to: CGPoint(x: 30, y: 200))
                context.addLine(to: CGPoint(x: width - 50, y: 200))
                context.strokePath()
                
                context.setStrokeColor(colorOfView().cgColor)
                context.move(to: CGPoint(x: 30, y: 300))
                context.addLine(to: CGPoint(x: width - 50, y: 300))
                context.strokePath()
                
                context.setStrokeColor(colorOfView().cgColor)
                context.move(to: CGPoint(x: 30, y: 100))
                context.addLine(to: CGPoint(x: width - 50, y: 100))
                context.strokePath()
                
                context.setStrokeColor(colorOfView().cgColor)
                context.move(to: CGPoint(x: 130, y: 100))
                context.addLine(to: CGPoint(x: 340, y: 270))
                context.addLine(to: CGPoint(x: 550, y: 100))
                context.strokePath()
                
            case 5:
                context.setStrokeColor(colorOfView().cgColor)
                context.move(to: CGPoint(x: 30, y: 200))
                context.addLine(to: CGPoint(x: width - 50, y: 200))
                context.strokePath()
                
                context.setStrokeColor(colorOfView().cgColor)
                context.move(to: CGPoint(x: 30, y: 300))
                context.addLine(to: CGPoint(x: width - 50, y: 300))
                context.strokePath()
                
                context.setStrokeColor(colorOfView().cgColor)
                context.move(to: CGPoint(x: 30, y: 100))
                context.addLine(to: CGPoint(x: width - 50, y: 100))
                context.strokePath()
                
                context.setStrokeColor(colorOfView().cgColor)
                context.move(to: CGPoint(x: 130, y: 100))
                context.addLine(to: CGPoint(x: 340, y: 270))
                context.addLine(to: CGPoint(x: 550, y: 100))
                context.strokePath()
                
                context.setStrokeColor(colorOfView().cgColor)
                context.move(to: CGPoint(x: 100, y: height - 100))
                context.addLine(to: CGPoint(x: 340, y: 100))
                context.addLine(to: CGPoint(x: 580, y: 280))
                context.strokePath()

                
            default:
                context.setStrokeColor(colorOfView().cgColor)
                context.move(to: CGPoint(x: 100, y: height - 100))
                context.addLine(to: CGPoint(x: 340, y: 100))
                context.addLine(to: CGPoint(x: 580, y: 280))
                context.strokePath()
            }
            
            
            //context.strokePath()
        }
    }
    
    //Mark:-Method for genrating Random Colors
    
    func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    func colorOfView () -> UIColor {
        return UIColor(red:   self.random(),
                       green: self.random(),
                       blue:  self.random(),
                       alpha: 1.0)
    }
 
    
    func randomNumber()-> Int{
        let random_number =  Int(arc4random_uniform(UInt32(200)) + UInt32(60));
        
        return random_number
        
    }
    
    func randomNumber1()-> Int{
        let random_number =  Int(arc4random_uniform(UInt32(250)) + UInt32(60));
        
        return random_number
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.removeFromSuperview()
    }
}
