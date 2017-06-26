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
    
    func createLineOne(context: CGContext, width: Int , xPos: Int)
    {
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: 180))
        context.addLine(to: CGPoint(x: width - xPos, y: 180))
        context.strokePath()
    
    }
    
    
    func createLineTwo(context: CGContext, width: Int , xPos: Int)
    {
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: 300))
        context.addLine(to: CGPoint(x: width - xPos, y: 300))
        context.strokePath()
    }
    
    
    func createLineThree(context: CGContext, width: Int , xPos: Int)
    {
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: 100))
        context.addLine(to: CGPoint(x: width - xPos, y: 100))
        context.strokePath()
    }
    
    func createLineFour(context: CGContext, width: Int , xPos: Int)
    {
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: 100))
        context.addLine(to: CGPoint(x: 340, y: 270))
        context.addLine(to: CGPoint(x: 550, y: 100))
        context.strokePath()
    }
    
    
    func createLineFive(context: CGContext, width: Int , height : Int, xPos: Int)
    {
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: height - 100))
        context.addLine(to: CGPoint(x: 340, y: 100))
        context.addLine(to: CGPoint(x: 580, y: 280))
        context.strokePath()
    }
    
    
    
    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext() {
            
            context.setStrokeColor(colorOfView().cgColor)
            context.setLineWidth(2)
            context.beginPath()
            let width = Int(self.frame.width)
            let height = Int(self.frame.height)
            
            let xPos = 100;

            switch numberOfLines {
            case 1:
                createLineOne(context: context, width: width, xPos: xPos);

            case 2:
                createLineOne(context: context, width: width, xPos: xPos);
                createLineTwo(context: context, width: width, xPos: xPos);

            case 3:
                createLineOne(context: context, width: width, xPos: xPos);
                createLineTwo(context: context, width: width, xPos: xPos);
                createLineThree(context: context, width: width, xPos: xPos);

            case 4:
                createLineOne(context: context, width: width, xPos: xPos);
                createLineTwo(context: context, width: width, xPos: xPos);
                createLineThree(context: context, width: width, xPos: xPos);
                createLineFour(context: context, width: width, xPos: xPos);
                
                
            case 5:
                createLineOne(context: context, width: width, xPos: xPos);
                createLineTwo(context: context, width: width, xPos: xPos);
                createLineThree(context: context, width: width, xPos: xPos);
                createLineFour(context: context, width: width, xPos: xPos);
                createLineFive(context: context, width: width, height: height , xPos: xPos);
                
            default:
                context.setStrokeColor(colorOfView().cgColor)
                context.move(to: CGPoint(x: xPos, y: height - 100))
                context.addLine(to: CGPoint(x: 340, y: 100))
                context.addLine(to: CGPoint(x: 580, y: 280))
                context.strokePath()
            }
            
            
            //context.strokePath()
        }
    }
    
    
    
    func createLineOne()
    {
    
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
