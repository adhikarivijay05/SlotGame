//
//  HomeViewController.swift
//  SlotGame
//
//  Created by Nitin Singh on 17/02/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {
    var items: [Int] = []
    var pianoSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "ANIMATE1", ofType: "WAV")!)
    var audioPlayer = AVAudioPlayer()
    @IBOutlet var carousel: iCarousel!
     var loginStatus : String = ""
    @IBOutlet weak var loginbtn: UIButton!
    @IBOutlet var namelabel: UILabel!
    
    @IBOutlet var creditlabel: UILabel!
    @IBOutlet var lotterylabel: UILabel!
    
    @IBOutlet var levellbl: UILabel!
    @IBOutlet var levelNumber: UILabel!
    
    //Mark:-for animating view Using NSlayoutConstarint
    @IBOutlet weak var centreAlignView: NSLayoutConstraint!
    @IBOutlet weak var centretopView: NSLayoutConstraint!

    
    @IBOutlet weak var lotteryView: UIView!
    @IBOutlet var countDownLTlabel: UILabel!
    @IBOutlet var dateLTlabel: UILabel!
    
     @IBOutlet weak var topView: UIView!
    
    
     var count = 3590
    
    
    
    
    @IBAction func buyMoreBtnClicked(_ sender: Any) {
        
        let homeViewObj = LotteryViewController.init(nibName: "LotteryViewController", bundle: nil)
        
        self.navigationController?.pushViewController(homeViewObj, animated: false)
        
    }
    
    
    @IBAction func myLTBtnClicked(_ sender: Any) {
        
        let homeViewObj = MyLotteryViewController.init(nibName: "MyLotteryViewController", bundle: nil)
        
        self.navigationController?.pushViewController(homeViewObj, animated: false)
        
    }
    
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        
        let homeViewObj = ViewController.init(nibName: "ViewController", bundle: nil)
        
        self.navigationController?.pushViewController(homeViewObj, animated: false)
        
//        for controller in self.navigationController!.viewControllers as Array {
//            if controller.isKind(of: ViewController.self) {
//                self.navigationController?.popToViewController(controller as UIViewController, animated: true)
//                break
//            }
//        }
        
          }
    @IBAction func menuBtnlicked(_ sender: Any) {
        
        let homeViewObj = PopUpViewController.init(nibName: "PopUpViewController", bundle: nil)
        
       
       self.navigationController?.pushViewController(homeViewObj, animated: false)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)

       
        
        if(Utility.getUserRole() == nil || Utility.getUserRole() == " ")
        {
            loginbtn.setImage(#imageLiteral(resourceName: "logout"), for:.normal);
            
        }else{
            
            loginbtn.setImage(#imageLiteral(resourceName: "loginbtn"), for:.normal);
            
        }
       
        
//        lotteryView.layer.borderWidth = 1
//        lotteryView.layer.borderColor = UIColor.white.cgColor
//        lotteryView.layer.cornerRadius = 10
        
        
        carousel.type = .cylinder
        for i in 0 ... 26 {
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
        
        dateLTlabel.text = "Date of next draw : 20/May/2017"
        var _ = Timer.scheduledTimer(timeInterval:1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)

        
    }
    func update() {
        if(count > 0) {
            // countDownLabel.text = String(count--)
            let hours = String(count / 3600)
            let minutes = String(count / 60)
            let seconds = String(count % 60)
            countDownLTlabel.text = String(format: "Countdown : %@", "\(hours + ":" + minutes + ":" + seconds)")
            count -= 1
            //countDownLabel.text = "\(count)"
            //count -= 1
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
               //self.topView.frame = basketTopFrame
        centreAlignView.constant -= view.bounds.height
        levellbl.text = String(format: "Level %@", "\(Scoring.sharedGameData.gameLevel)")
        levelNumber.text = String(format: "%@", "\(Scoring.sharedGameData.winningPoints)")
        print("Credits", "\(Scoring.sharedGameData.credits)")
        creditlabel.text = String(format: "%@ Credits", "\(Scoring.sharedGameData.credits)")
        lotterylabel.text = String(format: "%@", "\(Scoring.sharedGameData.lotteryTickets)")
        //loginbtn.alpha = 0.0
         carousel.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
     
        super.viewDidAppear(animated)
        
        
              UIView.animate(withDuration: 0.9, delay: 0.2, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.centreAlignView.constant += self.view.bounds.height
            self.view.layoutIfNeeded()
            self.loginbtn.alpha = 1.0

        }, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }

    func numberOfItems(in carousel: iCarousel) -> Int {
        return items.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var carousalView: CraousalView
        carousalView =  CraousalView.init(frame: CGRect(x: 0, y: 0, width: 250, height: 200))
        carousalView.addCustomView(index: index, viewFrame: carousalView.frame,isStage: false, iconName : "icon")
        
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
        
        if index == 0{
            let homeViewObj = GameViewController.init(nibName: "GameViewController", bundle: nil)
            
            homeViewObj.indexOfObject = index
            
            self.navigationController?.pushViewController(homeViewObj, animated: false)
        }else if (Scoring.sharedGameData.winningPoints > 15001) && index == 1
        {
            let homeViewObj = GameViewController.init(nibName: "GameViewController", bundle: nil)
            
            homeViewObj.indexOfObject = index

            
            self.navigationController?.pushViewController(homeViewObj, animated: false)
        }else if (Scoring.sharedGameData.winningPoints > 320001) && index == 2
        {
            let homeViewObj = GameViewController.init(nibName: "GameViewController", bundle: nil)
            
            homeViewObj.indexOfObject = index

            
            self.navigationController?.pushViewController(homeViewObj, animated: false)
        }else if (Scoring.sharedGameData.winningPoints > 3120000) && index == 3
        {
            let homeViewObj = GameViewController.init(nibName: "GameViewController", bundle: nil)
            
            homeViewObj.indexOfObject = index

            
            self.navigationController?.pushViewController(homeViewObj, animated: false)
        }
        
        
        
    }

}
