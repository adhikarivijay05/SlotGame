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
    
    func createLineOne(context: CGContext, width: Int ,height: Int , xPos: Int)
    {
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: xPos + 80))
        context.addLine(to: CGPoint(x: width - xPos, y: xPos + 80))
        context.strokePath()
        
    }
    
    
    func createLineTwo(context: CGContext, width: Int ,height: Int , xPos: Int)
    {
        createLineOne(context: context, width: width,height :height ,xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: height - xPos))
        context.addLine(to: CGPoint(x: width - xPos, y: height - xPos))
        context.strokePath()
    }
    
    
    func createLineThree(context: CGContext, width: Int ,height: Int , xPos: Int)
    {
        createLineTwo(context: context, width: width,height :height , xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: xPos))
        context.addLine(to: CGPoint(x: width - xPos, y: xPos))
        context.strokePath()
    }
    
    func createLineFour(context: CGContext, width: Int ,height: Int , xPos: Int)
    {
        //createLineThree(context: context, width: width,height :height , xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: xPos))
        context.addLine(to: CGPoint(x: 340, y: 270))
        context.addLine(to: CGPoint(x: 550, y: xPos))
        context.strokePath()
    }
    
    
    func createLineFive(context: CGContext, width: Int , height : Int, xPos: Int)
    {
        createLineFour(context: context, width: width, height :height ,xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: height - xPos))
        context.addLine(to: CGPoint(x: 340, y: xPos))
        context.addLine(to: CGPoint(x: 580, y: 280))
        context.strokePath()
    }
    
    func createLineSix(context: CGContext, width: Int , height : Int, xPos: Int)
    {
       // createLineFive(context: context, width: width,height :height  , xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: xPos))
        context.addLine(to: CGPoint(x: 220, y: xPos))
        context.addLine(to: CGPoint(x: 460, y: 280))
        context.addLine(to: CGPoint(x: 570, y: 280))
        context.strokePath()
    }
    func createLineSeven(context: CGContext, width: Int , height : Int, xPos: Int)
    {
        createLineSix(context: context, width: width, height: height , xPos: xPos);

        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: height - xPos))
        context.addLine(to: CGPoint(x: 220, y: height - xPos))
        context.addLine(to: CGPoint(x: 460, y: xPos))
        context.addLine(to: CGPoint(x: 570, y: xPos))
        
        context.strokePath()
    }
    
    func createLineEight(context: CGContext, width: Int , height : Int, xPos: Int)
    {
        //createLineSeven(context: context, width: width, height: height , xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: xPos + 80))
        context.addLine(to: CGPoint(x: 220, y: xPos))
        context.addLine(to: CGPoint(x: 340, y: xPos + 80))
        context.addLine(to: CGPoint(x: 460, y: xPos))
        context.addLine(to: CGPoint(x: 560, y: xPos + 80))
        
        context.strokePath()
    }
    
    func createLineNine(context: CGContext, width: Int , height : Int, xPos: Int)
    {
        createLineEight(context: context, width: width, height: height , xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: xPos + 80))
        context.addLine(to: CGPoint(x: 220, y: height - xPos))
        context.addLine(to: CGPoint(x: 340, y: xPos + 80))
        context.addLine(to: CGPoint(x: 460, y: height - xPos))
        context.addLine(to: CGPoint(x: 560, y: xPos + 80))
        
        context.strokePath()
    }
    
    func createLineTen(context: CGContext, width: Int , height : Int, xPos: Int)
    {
       // createLineNine(context: context, width: width, height: height , xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: xPos + 80))
        context.addLine(to: CGPoint(x: 220, y:  xPos))
        context.addLine(to: CGPoint(x: 460, y: xPos + xPos + 80))
        context.addLine(to: CGPoint(x: 560, y:  xPos + 80))
        context.strokePath()
    }
    
    func createLineEleven(context: CGContext, width: Int , height : Int, xPos: Int)
    {
        createLineTen(context: context, width: width, height: height , xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: xPos + 80))
        context.addLine(to: CGPoint(x: 220, y:  height - xPos))
        context.addLine(to: CGPoint(x: 460, y: xPos))
        context.addLine(to: CGPoint(x: 560, y:  xPos + 80))
        context.strokePath()
    }
    
    func createLineTwelve(context: CGContext, width: Int , height : Int, xPos: Int)
    {
       // createLineEleven(context: context, width: width, height: height , xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: xPos))
        context.addLine(to: CGPoint(x: 220, y: xPos + 80))
        context.addLine(to: CGPoint(x: 460, y: xPos + 80))
        context.addLine(to: CGPoint(x: 560, y:  xPos))
        
        context.strokePath()
    }
    
    func createLineThirteen(context: CGContext, width: Int , height : Int, xPos: Int)
    {
        createLineTwelve(context: context, width: width, height: height , xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: height - xPos))
        context.addLine(to: CGPoint(x: 220, y: xPos + 80))
        context.addLine(to: CGPoint(x: 460, y: xPos + 80))
        context.addLine(to: CGPoint(x: 560, y:  height - xPos))
        
        context.strokePath()
    }
    
    func createLineFourteen(context: CGContext, width: Int , height : Int, xPos: Int)
    {
        //createLineThirteen(context: context, width: width, height: height , xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: xPos + 80))
        context.addLine(to: CGPoint(x: 220, y: xPos))
        context.addLine(to: CGPoint(x: 460, y: xPos ))
        context.addLine(to: CGPoint(x: 560, y:  xPos + 80))
        
        context.strokePath()
    }
    
    func createLineFifteen(context: CGContext, width: Int , height : Int, xPos: Int)
    {
        createLineFourteen(context: context, width: width, height: height , xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: xPos + 80))
        context.addLine(to: CGPoint(x: 220, y: height - xPos))
        context.addLine(to: CGPoint(x: 460, y: height - xPos ))
        context.addLine(to: CGPoint(x: 560, y:  xPos + 80))
        
        context.strokePath()
    }
    
    func createLineSixteen(context: CGContext, width: Int , height : Int, xPos: Int)
    {
        // createLineFifteen(context: context, width: width, height: height , xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: xPos))
        context.addLine(to: CGPoint(x: 220, y: xPos + 80))
        context.addLine(to: CGPoint(x: 340, y: xPos ))
        context.addLine(to: CGPoint(x: 460, y: xPos + 80))
        context.addLine(to: CGPoint(x: 560, y: xPos ))
        
        context.strokePath()
    }
    
    func createLineSeventeen(context: CGContext, width: Int , height : Int, xPos: Int)
    {
        createLineSixteen(context: context, width: width, height: height , xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: height - xPos))
        context.addLine(to: CGPoint(x: 220, y: xPos + 80))
        context.addLine(to: CGPoint(x: 340, y: height - xPos ))
        context.addLine(to: CGPoint(x: 460, y: xPos + 80))
        context.addLine(to: CGPoint(x: 560, y: height - xPos ))
        
        context.strokePath()
    }
    
    func createLineEighteen(context: CGContext, width: Int , height : Int, xPos: Int)
    {
        //createLineSeventeen(context: context, width: width, height: height , xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: xPos + 80))
        context.addLine(to: CGPoint(x: 220, y: xPos + 80))
        context.addLine(to: CGPoint(x: 340, y: xPos ))
        context.addLine(to: CGPoint(x: 460, y: xPos + 80))
        context.addLine(to: CGPoint(x: 560, y: xPos + 80 ))
        
        context.strokePath()
    }
    

    func createLineNinteen(context: CGContext, width: Int , height : Int, xPos: Int)
    {
        createLineEighteen(context: context, width: width, height: height , xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: xPos + 80))
        context.addLine(to: CGPoint(x: 220, y: xPos + 80))
        context.addLine(to: CGPoint(x: 340, y: height - xPos ))
        context.addLine(to: CGPoint(x: 460, y: xPos + 80))
        context.addLine(to: CGPoint(x: 560, y: xPos + 80 ))
        
        context.strokePath()
    }
    func createLineTwenty(context: CGContext, width: Int , height : Int, xPos: Int)
    {
//        createLineNinteen(context: context, width: width, height: height , xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: height - xPos))
        context.addLine(to: CGPoint(x: 220, y: height - xPos))
        context.addLine(to: CGPoint(x: 340, y:  xPos ))
        context.addLine(to: CGPoint(x: 460, y: height - xPos))
        context.addLine(to: CGPoint(x: 560, y: height - xPos ))
        
        context.strokePath()
    }
    
    func createLineTwentyOne(context: CGContext, width: Int , height : Int, xPos: Int)
    {
        createLineTwenty(context: context, width: width, height: height , xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: xPos))
        context.addLine(to: CGPoint(x: 220, y:  xPos))
        context.addLine(to: CGPoint(x: 340, y:  height - xPos ))
        context.addLine(to: CGPoint(x: 460, y: xPos))
        context.addLine(to: CGPoint(x: 560, y:  xPos ))
        
        context.strokePath()
    }
    
    func createLineTwentyTwo(context: CGContext, width: Int , height : Int, xPos: Int)
    {
//        createLineTwentyOne(context: context, width: width, height: height , xPos: xPos);
        
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: xPos))
        context.addLine(to: CGPoint(x: 220, y:  xPos))
        context.addLine(to: CGPoint(x: 340, y:  height - xPos ))
        context.addLine(to: CGPoint(x: 460, y: height - xPos))
        context.addLine(to: CGPoint(x: 560, y:  height - xPos ))
        
        context.strokePath()
    }
    func createLineTwentyThree(context: CGContext, width: Int , height : Int, xPos: Int)
    {
        createLineTwentyTwo(context: context, width: width, height: height , xPos: xPos);
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: height - xPos))
        context.addLine(to: CGPoint(x: 220, y:  height - xPos))
        context.addLine(to: CGPoint(x: 340, y:  xPos ))
        context.addLine(to: CGPoint(x: 460, y: xPos))
        context.addLine(to: CGPoint(x: 560, y:  xPos ))
        
        context.strokePath()
    }
    
    func createLineTwentyFour(context: CGContext, width: Int , height : Int, xPos: Int)
    {
        //createLineTwentyThree(context: context, width: width, height: height , xPos: xPos);
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: xPos))
        context.addLine(to: CGPoint(x: 220, y:  height - xPos))
        context.addLine(to: CGPoint(x: 460, y: height - xPos))
        context.addLine(to: CGPoint(x: 560, y:  xPos ))
        
        context.strokePath()
    }
    
    func createLineTwentyFive(context: CGContext, width: Int , height : Int, xPos: Int)
    {
        createLineTwentyFour(context: context, width: width, height: height , xPos: xPos);
        context.setStrokeColor(colorOfView().cgColor)
        context.move(to: CGPoint(x: xPos, y: height - xPos))
        context.addLine(to: CGPoint(x: 220, y:  xPos))
        context.addLine(to: CGPoint(x: 460, y: xPos))
        context.addLine(to: CGPoint(x: 560, y:  height - xPos ))
        
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
                createLineOne(context: context, width: width, height: height , xPos: xPos);
                
            case 2:
                createLineTwo(context: context, width: width,height: height , xPos: xPos);
                
            case 3:
                createLineThree(context: context, width: width,height: height , xPos: xPos);
                
            case 4:
                createLineFour(context: context, width: width, height: height ,xPos: xPos);
                
            case 5:
                createLineFive(context: context, width: width, height: height , xPos: xPos);
            
            case 6:
                createLineSix(context: context, width: width, height: height, xPos: xPos)

            case 7:
                createLineSeven(context: context, width: width, height: height, xPos: xPos)
           
            case 8:
                createLineEight(context: context, width: width, height: height, xPos: xPos)

            case 9:
                createLineNine(context: context, width: width, height: height, xPos: xPos)
            
            case 10:
                createLineTen(context: context, width: width, height: height, xPos: xPos)
                
            case 11:
                createLineEleven(context: context, width: width, height: height, xPos: xPos)

            case 12:
                createLineTwelve(context: context, width: width, height: height, xPos: xPos)

            case 13:
                createLineThirteen(context: context, width: width, height: height, xPos: xPos)

            case 14:
                createLineFourteen(context: context, width: width, height: height, xPos: xPos)

            case 15:
                createLineFifteen(context: context, width: width, height: height, xPos: xPos)

            case 16:
                createLineSixteen(context: context, width: width, height: height, xPos: xPos)

            case 17:
                createLineSeventeen(context: context, width: width, height: height, xPos: xPos)
                
            case 18:
                createLineEighteen(context: context, width: width, height: height, xPos: xPos)
                
            case 19:
                createLineNinteen(context: context, width: width, height: height, xPos: xPos)
                
            case 20:
                createLineTwenty(context: context, width: width, height: height, xPos: xPos)
                
            case 21:
                createLineTwentyOne(context: context, width: width, height: height, xPos: xPos)
                

            case 22:
                createLineTwentyTwo(context: context, width: width, height: height, xPos: xPos)
                
            case 23:
                createLineTwentyThree(context: context, width: width, height: height, xPos: xPos)
                
            case 24:
                createLineTwentyFour(context: context, width: width, height: height, xPos: xPos)
                
            case 25:
                createLineTwentyFive(context: context, width: width, height: height, xPos: xPos)
                


                
            default:
                context.setStrokeColor(colorOfView().cgColor)
                context.move(to: CGPoint(x: xPos, y: height - xPos))
                context.addLine(to: CGPoint(x: 220, y:  xPos))
                context.addLine(to: CGPoint(x: 460, y: xPos))
                context.addLine(to: CGPoint(x: 560, y:  height - xPos ))
                
                context.strokePath()


            }
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
