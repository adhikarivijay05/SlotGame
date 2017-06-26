//
//  StagesViewController.swift
//  SlotGame
//
//  Created by Sachin on 19/02/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit
import AVFoundation

enum SubCategory {
    case DragonsandDungeons
    case SportsofRisk
    case WarAir
    case Felines
    case Space
    case Japanese
    case LuxuryCars
    case Motorcycle
    case MartialArts
    case Ninja
}

class StagesViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {
    var items: [Int] = []
    var subName : String = ""
    
    var pianoSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "ANIMATE1", ofType: "WAV")!)
    var audioPlayer = AVAudioPlayer()
    
    
    @IBOutlet var carousel: iCarousel!
    var subCategoryName : Int = 0
    @IBOutlet var namelabel: UILabel!
    @IBOutlet weak var centreAlignView: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if subCategoryName == 8 {
            subName = "martialArt"
        }
        else if subCategoryName == 9 {
            subName = "ninja"
        }else{
            subName = "icon"
        }
        
        
        carousel.type = .cylinder
        for i in 0 ... 9 {
            items.append(i)
        }
        carousel.reloadData()
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: pianoSound as URL )
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        audioPlayer.prepareToPlay()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.topView.frame = basketTopFrame
        centreAlignView.constant -= view.bounds.height
        
        //loginbtn.alpha = 0.0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        super.viewDidAppear(animated)
        
        
        UIView.animate(withDuration: 0.9, delay: 0.2, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.centreAlignView.constant += self.view.bounds.height
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfItems(in carousel: iCarousel) -> Int {
        return items.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var carousalView: CraousalView
        carousalView =  CraousalView.init(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        carousalView.addCustomView(index: index, viewFrame: carousalView.frame, isStage: true, iconName : subName)
        
        return carousalView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .spacing) {
            return value * 1.1
        }
        return value
    }
    func carouselDidEndDecelerating(_ carousel: iCarousel) {
        
        
    }
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
        audioPlayer.stop()
    }
    
    func carouselWillBeginScrollingAnimation(_ carousel: iCarousel) {
        audioPlayer.play()
    }
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        let homeViewObj = GameViewController.init(nibName: "GameViewController", bundle: nil)
        self.navigationController?.pushViewController(homeViewObj, animated: false)
    }

}
