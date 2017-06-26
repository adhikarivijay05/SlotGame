//
//  GameViewController.swift
//  SlotGame
//
//  Created by Nitin Chauhan on 26/02/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit
import AVFoundation

import FBSDKLoginKit

import Social

class GameViewController: UIViewController {
    var pianoSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "ANIMATE1", ofType: "WAV")!)
    var audioPlayer = AVAudioPlayer()
   var tableInts:[Int] = [3,5,9,23,21,7,1,13,17,25,11,15,19]
    
    @IBOutlet var creditlabel: UILabel!
    @IBOutlet var betlabel: UILabel!
    @IBOutlet var lineslabel: UILabel!
    @IBOutlet var winnerPaidlabel: UILabel!
    @IBOutlet var Levellabel: UILabel!
    @IBOutlet var levelNumberlabel: UILabel!
    @IBOutlet weak var centreAlignView: NSLayoutConstraint!
    var _lineCustomView: UIView!

    @IBOutlet var totalDeduction: UILabel!
    @IBOutlet  var _slotMachine: ZCSlotMachine!
    var _slotIcons: [UIImage] = []
    var _slotOneImageView : UIImageView!
    var _slotTwoImageView : UIImageView!
    var _slotThreeImageView : UIImageView!
    var _slotFourImageView : UIImageView!
    var _slotFiveImageView : UIImageView!
     var _slotContainerView : UIView!
    @IBOutlet var slotBg: UIImageView!
    var indexOfObject: Int!

    
    let MAX : UIntMax = 999999999
    let MIN : UIntMax = 111111111
    
//    @IBOutlet var carousel1: iCarousel!
//    var items: [Int] = []
    var lineView = LineView()
    
   @IBOutlet var firstContainer: UIView!
   @IBOutlet var secondContainer: UIView!
   @IBOutlet var thirdContainer: UIView!
   @IBOutlet var fourthContainer: UIView!
   @IBOutlet var fifthContainer: UIView!
    
    var slots: [[Slot]] = []
    var kNumberOfContainers = 3
    var kNumberOfSlots = 3
    let utility = Utility()
    //stats
    
    
    let kMarginForView:CGFloat = 10.0
    let kMarginForSlot:CGFloat = 20.0
    let kMarginForSlotheight:CGFloat = 10.0
    let kSixth:CGFloat = 1.0/6.0
    let kThird:CGFloat = 1.0/3.0
    let kHalf:CGFloat = 1.0/2.0
    let kEight:CGFloat = 1.0/8.0
    
    
    var isDecrease : Int =  0
    
    
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
     @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var spinBtn: UIButton!
    @IBOutlet weak var shareOnFacebookBtn:UIButton!
    var tableIntRight:[Int] = [15,13,11,9,7,5,3,1,2,4,6,8,10,12,14]
    @IBOutlet var tableView : UITableView?
    @IBOutlet var tableViewRight : UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.register(UINib(nibName: "NumberCell", bundle: nil), forCellReuseIdentifier: "numberCell")
        self.tableView?.backgroundColor = UIColor.clear

        tableViewRight?.delegate = self
        tableViewRight?.dataSource = self
        
        tableViewRight?.register(UINib(nibName: "NumberCell", bundle: nil), forCellReuseIdentifier: "numberCell")
        self.tableViewRight?.backgroundColor = UIColor.clear
        tableView?.allowsSelection = false;
        tableViewRight?.allowsSelection = false;
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: pianoSound as URL )
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }

        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
        setUI()
        hardReset()
        createArray()
        
//        carousel1.type = .linear
//        carousel1.isVertical = true
        initiateZCSlotMachineGame()
        
        

        
//        for i in 0 ... 9 {
//            items.append(i)
//        }
        
     //   let imageView = UIImageView(image: #imageLiteral(resourceName: "image.png")) // This would be your mapView, here I am just using a random image
        
        
              // Do any additional setup after loading the view.
    }
    
    func tapBlurButton(_ sender: UITapGestureRecognizer) {
        print("Remove superView!")
        
        _lineCustomView.isHidden = true
        lineView.removeFromSuperview()
    }
    
    @IBAction func homeButtonClicked(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: HomeViewController.self) {
                self.navigationController?.popToViewController(controller as UIViewController, animated: true)
                break
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.topView.frame = basketTopFrame
        centreAlignView.constant -= view.bounds.height
        
//        var views : (frontView: UIView, backView: UIView)
//        
//        // set a transition style
//        let transitionOptions = UIViewAnimationOptions.transitionCurlUp
//        
//        // with no animation block, and a completion block set to 'nil' this makes a single line of code
//        UIView.transitionFromView(views.frontView, toView:views.backView, duration: 1.0, options: transitionOptions, completion: nil)
//        
        //loginbtn.alpha = 0.0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        super.viewDidAppear(animated)
        
        
        UIView.animate(withDuration: 0.9, delay: 0.2, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.centreAlignView.constant += self.view.bounds.height
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }


    
    func initiateZCSlotMachineGame() {
        _slotMachine = ZCSlotMachine.init(frame: CGRect.init(x: 85, y: 62, width: 350, height: 268))
        _slotMachine.center = CGPoint.init(x: 150, y: 120)
        _slotMachine.delegate  = self
        _slotMachine.dataSource = self
        self.view.addSubview(_slotMachine)
        
        _slotContainerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 180, height: 45))
        _slotContainerView.center = CGPoint.init(x: 150, y: 350)
         self.view.addSubview(_slotContainerView)
        
        _slotOneImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 40))
        _slotOneImageView.contentMode = UIViewContentMode.center
        _slotContainerView.addSubview(_slotOneImageView)
        
        _slotTwoImageView = UIImageView.init(frame: CGRect.init(x: 45, y: 0, width: 40, height: 40))
        _slotTwoImageView.contentMode = UIViewContentMode.center
        _slotContainerView.addSubview(_slotTwoImageView)
        
        _slotThreeImageView = UIImageView.init(frame: CGRect.init(x: 90, y: 0, width: 40, height: 40))
        _slotThreeImageView.contentMode = UIViewContentMode.center
        _slotContainerView.addSubview(_slotThreeImageView)
        
        _slotFourImageView = UIImageView.init(frame: CGRect.init(x: 135, y: 0, width: 40, height: 40))
        _slotFourImageView.contentMode = UIViewContentMode.center
        _slotContainerView.addSubview(_slotFourImageView)
        
        _slotFiveImageView = UIImageView.init(frame: CGRect.init(x: 175, y: 0, width: 40, height: 40))
        _slotFiveImageView.contentMode = UIViewContentMode.center
        _slotContainerView.addSubview(_slotFiveImageView)
        _slotContainerView.isHidden = true
        
    }
    
    
    func createArray()  {   //->  Array<Any>
        
        
        for i in 1 ... 10 {
            
            
            switch indexOfObject {
            case 0:
                
                 _slotIcons.append(UIImage(named:"Motorcycle_icon\(i)")!)
                slotBg.image = #imageLiteral(resourceName: "slotbg1")
                break
            case 1:
                
                _slotIcons.append(UIImage(named:"articraft_icon\(i)")!)

                
               break
            case 2:
                
                _slotIcons.append(UIImage(named:"dragon_icon\(i)")!)
                
                
                break
            case 3:
                
                _slotIcons.append(UIImage(named:"articraft_icon\(i)")!)
                
                
                break
                
            default:
                break
            }
            
            
        
        }
 

    }
    
    
    @IBAction func plusBtnLines(_ sender: UIButton) {
        isDecrease = 1
        
        _lineCustomView = UIView(frame: self.view.frame)
         self.view.addSubview(_lineCustomView)
       // for i in 0 ... Scoring.sharedGameData.noofLines {
            
           
             //lineView = LineView(frame: self._lineCustomView.frame)
           lineView = LineView(frame: self._lineCustomView.frame, lines: Scoring.sharedGameData.noofLines)

          //  lineView.mapLines(lines: Scoring.sharedGameData.noofLines)
            self._lineCustomView.addSubview(lineView)
       //}
        var _ = Timer.scheduledTimer(timeInterval:1.0, target: self, selector: Selector("update1"), userInfo: nil, repeats: false)
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
//        _lineCustomView .addGestureRecognizer(tapGesture)

        
        if Scoring.sharedGameData.noofLines > 24 {
            return
        }
        Scoring.sharedGameData.noofLines = Scoring.sharedGameData.noofLines + 1
        updateMainView()
    }
    func update1() {
        _lineCustomView.removeFromSuperview()
    }
    @IBAction func minusBtnLines(_ sender: UIButton) {
        isDecrease = 1
        
        
        
        if Scoring.sharedGameData.noofLines < 1 {
            return
        }
        Scoring.sharedGameData.noofLines = Scoring.sharedGameData.noofLines - 1
        updateMainView()
    }
    
    
    @IBAction func plusBtnClicked(_ sender: UIButton) {
        isDecrease = 0
        if Scoring.sharedGameData.lastBet > 19 {
            return
        }
        
        Scoring.sharedGameData.lastBet = Scoring.sharedGameData.lastBet + 1
        updateMainView()
    }
    @IBAction func minusBtnClicked(_ sender: UIButton) {
        isDecrease = 2
        if Scoring.sharedGameData.lastBet < 2 {
            return
        }
        Scoring.sharedGameData.lastBet = Scoring.sharedGameData.lastBet - 1
        updateMainView()
    }
    
    @IBAction func facebookBtnClicked(_ sender: Any) {
        let vc = SLComposeViewController(forServiceType:SLServiceTypeFacebook)
                vc?.add(URL(string: "http://www.slotMachine.com/"))
                vc?.setInitialText("This is slotMachine game.")
                self.present(vc!, animated: true, completion: nil)
    }
    
    func slotModifyUI() {
        
        
    }
    
    func setUI() {
        settingBtn.layer.borderWidth = 1
        settingBtn.layer.borderColor = UIColor.white.cgColor
        settingBtn.layer.cornerRadius = 10
        homeBtn.layer.borderWidth = 1
        homeBtn.layer.borderColor = UIColor.white.cgColor
        homeBtn.layer.cornerRadius = 10
        homeButton.layer.borderWidth = 1
        homeButton.layer.borderColor = UIColor.white.cgColor
        homeButton.layer.cornerRadius = 10
        shareOnFacebookBtn.layer.cornerRadius = 10
        
    }
    
    @IBAction func spinBtnClicked(_ sender: UIButton) {
      
        if (sender.currentTitle == "STOP"){
             audioPlayer.play()
            _slotMachine .stopSliding()
           
        }else{
            audioPlayer.play()
            // var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: false);
            if isDecrease == 0 {
                isDecrease = 3
                Scoring.sharedGameData.credits =  Scoring.sharedGameData.credits - (Scoring.sharedGameData.lastBet *  Scoring.sharedGameData.noofLines)
                totalDeduction.text =  String(format: "%@", "\((Scoring.sharedGameData.lastBet *  Scoring.sharedGameData.noofLines))")
            }
            if isDecrease == 2 {
                isDecrease = 3
                Scoring.sharedGameData.credits =  Scoring.sharedGameData.credits + (Scoring.sharedGameData.lastBet *  Scoring.sharedGameData.noofLines)
                totalDeduction.text =  String(format: "%@", "\((Scoring.sharedGameData.lastBet *  Scoring.sharedGameData.noofLines))")
            }
            updateMainView()
            startZCSlotMachine()
        }
        
        
        
    }
    func update() {
        removeSlotImageViews()
        slots = Factory.createSlots()
        setupSecondContainer(self.secondContainer)
       // spinBtn.isUserInteractionEnabled = false
        var winningsMultiplier = SlotBrain.computeWinnings(slots)
        winnings = winningsMultiplier * Scoring.sharedGameData.lastBet
        Scoring.sharedGameData.winningPoints += winnings
        
        isDecrease = 1
        
//        if Scoring.sharedGameData.credits >= 150 {
//            levelNumberlabel.text = "300"
//            showAlertWithText(header: "Congrats", message: "You reached on Next Level")
//        }
       // currentBet = 0
        updateMainView()
    }
    func setupSecondContainer(_ containerView: UIView) {
        
        for containerNumber in 0 ..< kNumberOfContainers {
            //  kNumberOfContainers += 1
            for slotNumber in 0 ..< kNumberOfSlots {
                
                
                var slot: Slot
                let slotImageView = UIImageView()
                
                if(slots.count != 0){
                    let slotContainer = slots[containerNumber]
                    slot = slotContainer[slotNumber]
                    slotImageView.image = slot.image
                }
                else{
                    slotImageView.image = UIImage(named: "")
                }
                // kNumberOfSlots += 1
                slotImageView.backgroundColor = UIColor.clear
                slotImageView.frame = CGRect(x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird), y: containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird), width: containerView.bounds.width * kThird - kMarginForSlot, height: containerView.bounds.height * kThird - kMarginForSlotheight)
                containerView.addSubview(slotImageView)
                containerView.isHidden = false
                slotImageView.isHidden = false

            }
            
        }
        audioPlayer.stop()
       // spinBtn.isUserInteractionEnabled = true

    }
    
    @IBAction func homebtnClicked(_ sender: Any) {
        let homeViewObj = ZCGameViewController.init(nibName: "ZCGameViewController", bundle: nil)
        self.navigationController?.pushViewController(homeViewObj, animated: false)


    }
    @IBAction func settingBtn(_ sender: Any) {
//        let homeViewObj = ZCGameViewController.init(nibName: "ZCGameViewController", bundle: nil)
//        self.navigationController?.pushViewController(homeViewObj, animated: false)
        hardReset()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func removeSlotImageViews(){
        if self.secondContainer != nil {
            let container: UIView? = self.secondContainer
            let subViews: Array? = container!.subviews
            for view in subViews! {
                view.removeFromSuperview()
            }
        }
    }
    
    func hardReset(){
        removeSlotImageViews()
        slots.removeAll(keepingCapacity: true)
        self.setupSecondContainer(self.secondContainer)
        winnings = 0
        Levellabel.text = String(format: "Level %@", "\(Scoring.sharedGameData.gameLevel)")

        totalDeduction.text = String(format: "%@", "\((Scoring.sharedGameData.lastBet *  Scoring.sharedGameData.noofLines))")
        
        Scoring.sharedGameData.lastBet = 1
     //   levelNumberlabel.text = "0"
        updateMainView()
    }
    
    
    
    
    func updateMainView(){
        
        
        self.creditlabel.text =  String(format: "%@ Credits", "\(Scoring.sharedGameData.credits)")

        self.betlabel.text = "\(Scoring.sharedGameData.lastBet)"
        
        self.lineslabel.text = "\(Scoring.sharedGameData.noofLines)"
        
        self.winnerPaidlabel.text = "\(winnings)"
        
        levelNumberlabel.text = "\(Scoring.sharedGameData.winningPoints)"
        
        
        
    }
    
    func showAlertWithText(header: String, message: String){
        let alert = UIAlertController(title: header, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    
   /*
    func numberOfItems(in carousel: iCarousel) -> Int {
        return _slotIcons.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var carousalView: CraousalView
        carousalView =  CraousalView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        carousalView.addCustomView(index: index, viewFrame: carousalView.frame,isStage: false, iconName : "gameicon")
        
        return carousalView
    }
    */
    
    
    func startZCSlotMachine() {
        let slotIconCount : Int = _slotIcons.count
       
        let slotOneIndex = Swift.abs(Int(arc4random_uniform(12)) % slotIconCount)
        let slotTwoIndex = Swift.abs(Int(arc4random_uniform(12)) % slotIconCount)
        let slotThreeIndex = Swift.abs(Int(arc4random_uniform(12)) % slotIconCount)
        let slotFourIndex = Swift.abs(Int(arc4random_uniform(12)) % slotIconCount)
        let slotFiveIndex = Swift.abs(Int(arc4random_uniform(12)) % slotIconCount)
        _slotOneImageView.image = _slotIcons[slotOneIndex];
         _slotTwoImageView.image = _slotIcons[slotTwoIndex];
         _slotThreeImageView.image = _slotIcons[slotThreeIndex];
         _slotFourImageView.image = _slotIcons[slotFourIndex];
        _slotFiveImageView.image = _slotIcons[slotFiveIndex];
        
        let resultarray: NSArray? = NSArray(objects: NSNumber.init(value: slotOneIndex), NSNumber.init(value: slotTwoIndex),NSNumber.init(value: slotThreeIndex),NSNumber.init(value: slotFourIndex),NSNumber.init(value: slotFiveIndex))
        
        _slotMachine.slotResults = resultarray as! [Any]!
        _slotMachine .startSliding()
            }
    
    
}

extension GameViewController : ZCSlotMachineDelegate
{
    func slotMachineWillStartSliding(_ slotMachine: ZCSlotMachine!) {
       // spinBtn.isEnabled = false
       spinBtn.setTitle("STOP", for: UIControlState.normal)
        spinBtn.tag = 100
        audioPlayer.play()

    }
    
    func slotMachineDidEndSliding(_ slotMachine: ZCSlotMachine!) {
      //  spinBtn.isEnabled = true
        spinBtn.setBackgroundImage(#imageLiteral(resourceName: "spinbtn"), for: UIControlState.normal)
         spinBtn.setTitle("SPIN", for: UIControlState.normal)
       audioPlayer.stop()
        removeSlotImageViews()
        slots = Factory.createSlots()
        setupSecondContainer(self.secondContainer)
        // spinBtn.isUserInteractionEnabled = false
        var winningsMultiplier = SlotBrain.computeWinnings(slots)
        winnings = winningsMultiplier * Scoring.sharedGameData.lastBet
        Scoring.sharedGameData.winningPoints += winnings
        Scoring.sharedGameData.credits += winnings
        Scoring.sharedGameData.credits = Scoring.sharedGameData.credits - Scoring.sharedGameData.lastBet
     //   totalDeduction.text =  String(format: "TD: %@", "\((Scoring.sharedGameData.lastBet))")
        isDecrease = 1
        setlevel()
        
       // currentBet = 0
        updateMainView()
    }
    
    func setlevel() {
       let points = Scoring.sharedGameData.winningPoints
        if points >= 50 && points <= 150 {
            Scoring.sharedGameData.credits = Scoring.sharedGameData.credits + 200
            Levellabel.text = "LEVEL 2"
            DispatchQueue.once(token: "com.slotgame.level1") {
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 200
                Scoring.sharedGameData.gameLevel = 2
                
                
                utility.popUpAlert(title : "Congrats", message : "You cleared first level and won 200 credits, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                
                
                
                
            }
//            DispatchQueue.main.async {
//                let homeViewObj = TicketViewController.init(nibName: "TicketViewController", bundle: nil)
//                homeViewObj.lotterylabel.text = "\(self.randomNumber())"
//                homeViewObj.textLabel.text = "You cleared first level and won 200 credits, Lottery Ticket number is"
//                self.navigationController?.pushViewController(homeViewObj, animated: false)
//            }
        }
        if points >= 150 && points <= 300 {
             Levellabel.text = "LEVEL 3"
            DispatchQueue.once(token: "com.slotgame.level2") {
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 250
                Scoring.sharedGameData.gameLevel = 3
//                DispatchQueue.main.async {
//                    let homeViewObj = TicketViewController.init(nibName: "TicketViewController", bundle: nil)
//                    homeViewObj.lotterylabel.text = "\(self.randomNumber())"
//                    homeViewObj.textLabel.text = "You cleared Second level and won 250 credits, Lottery Ticket number is"
//                    self.navigationController?.pushViewController(homeViewObj, animated: false)
//                }
                
            utility.popUpAlert(title : "Congrats", message : "You cleared Second level and won 250 credits, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                
                
            }
        }
        if points >= 300 && points <= 600{
             Levellabel.text = "LEVEL 4"
            DispatchQueue.once(token: "com.slotgame.level3") {
                utility.popUpAlert(title : "Congrats", message : "You cleared third level and won 250 credits, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 250
                Scoring.sharedGameData.gameLevel = 4
                myLotteryTicket()
            }
        }
        if points >= 600 && points <= 1200{
            
             Levellabel.text = "LEVEL 5"
            DispatchQueue.once(token: "com.slotgame.level4") {
                utility.popUpAlert(title : "Congrats", message : "You cleared fourth level and won bonus roulette, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 250
                Scoring.sharedGameData.gameLevel = 5
                myLotteryTicket()
            }
        }
        if points >= 1200 && points <= 2500{
            
             Levellabel.text = "LEVEL 6"
            DispatchQueue.once(token: "com.slotgame.level5") {
                utility.popUpAlert(title : "Congrats", message : "You cleared fifth level and won 500 credits, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 500
                Scoring.sharedGameData.gameLevel = 6
                myLotteryTicket()            }
        }
        if points >= 2501 && points <= 5000{
            
             Levellabel.text = "LEVEL 7"
            DispatchQueue.once(token: "com.slotgame.level6") {
                utility.popUpAlert(title : "Congrats", message : "You cleared sixth level and won 1000 credits, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 1000
                Scoring.sharedGameData.gameLevel = 7
                myLotteryTicket()
            }
        }
        if points >= 5001 && points <= 10000{
             Levellabel.text = "LEVEL 8"
            DispatchQueue.once(token: "com.slotgame.level7") {
                utility.popUpAlert(title : "Congrats", message : "You cleared seventh level and won 2000 credits, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 2000
                Scoring.sharedGameData.gameLevel = 8
                myLotteryTicket()            }
        }
        if points >= 10000 && points <= 15000{
             Levellabel.text = "LEVEL 9"
            DispatchQueue.once(token: "com.slotgame.level8") {
               
                
                //Todo Congrats Screen 
                
                utility.popUpAlert(title : "Congrats", message : "Your next stage is open.Lets play and win more points." , cancelButton : "OK", defaultButton : "cancel", ref : self)
                
                
                utility.popUpAlert(title : "Congrats", message : "You cleared eigth level and won 3000 credits, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 3000
                Scoring.sharedGameData.gameLevel = 9
                myLotteryTicket()
            }
        }
        if points >= 15000 && points <= 30000{
            Levellabel.text = "LEVEL 10"
            DispatchQueue.once(token: "com.slotgame.level9") {
                
                
                
                utility.popUpAlert(title : "Congrats", message : "You cleared ninth level and won bonus roulette, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 3000
                Scoring.sharedGameData.gameLevel = 10
                myLotteryTicket()
            }
        }
        if credits >= 30001 && credits <= 50000{
            Levellabel.text = "LEVEL 11"
            DispatchQueue.once(token: "com.slotgame.level10") {
                utility.popUpAlert(title : "Congrats", message : "You cleared tenth level and won bonus roulette, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 3000
                Scoring.sharedGameData.gameLevel = 11
                myLotteryTicket()
            }
        }
        if credits >= 50001 && credits <= 80000{
            Levellabel.text = "LEVEL 12"
            DispatchQueue.once(token: "com.slotgame.level11") {
                utility.popUpAlert(title : "Congrats", message : "You cleared eleventh level and won bonus roulette, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 3000
                Scoring.sharedGameData.gameLevel = 12
                myLotteryTicket()
            }
        }
        if credits >= 80001 && credits <= 110000{
            Levellabel.text = "LEVEL 13"
            DispatchQueue.once(token: "com.slotgame.level11") {
                utility.popUpAlert(title : "Congrats", message : "You cleared twelfth level and won bonus roulette, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 3000
                Scoring.sharedGameData.gameLevel = 13
                myLotteryTicket()
            }
        }
        if credits >= 110001 && credits <= 140000{
            Levellabel.text = "LEVEL 14"
            DispatchQueue.once(token: "com.slotgame.level11") {
                utility.popUpAlert(title : "Congrats", message : "You cleared eleventh level and won bonus roulette, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 3000
                Scoring.sharedGameData.gameLevel = 14
                myLotteryTicket()
            }
        }
        if credits >= 140001 && credits <= 170000{
            Levellabel.text = "LEVEL 15"
            DispatchQueue.once(token: "com.slotgame.level11") {
                utility.popUpAlert(title : "Congrats", message : "You cleared eleventh level and won bonus roulette, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 3000
                Scoring.sharedGameData.gameLevel = 15
                myLotteryTicket()
            }
        }
        if credits >= 170001 && credits <= 200000{
            Levellabel.text = "LEVEL 16"
            DispatchQueue.once(token: "com.slotgame.level11") {
                utility.popUpAlert(title : "Congrats", message : "You cleared eleventh level and won bonus roulette, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 3000
                Scoring.sharedGameData.gameLevel = 16
                myLotteryTicket()
            }
        }
        if credits >= 200001 && credits <= 230000{
            Levellabel.text = "LEVEL 17"
            DispatchQueue.once(token: "com.slotgame.level11") {
                utility.popUpAlert(title : "Congrats", message : "You cleared eleventh level and won bonus roulette, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 3000
                Scoring.sharedGameData.gameLevel = 17
                myLotteryTicket()
            }
        }
        if credits >= 230001 && credits <= 260000{
            Levellabel.text = "LEVEL 18"
            DispatchQueue.once(token: "com.slotgame.level11") {
                utility.popUpAlert(title : "Congrats", message : "You cleared eleventh level and won bonus roulette, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 3000
                Scoring.sharedGameData.gameLevel = 18
                myLotteryTicket()
            }
        }
        if credits >= 260001 && credits <= 290000{
            Levellabel.text = "LEVEL 19"
            DispatchQueue.once(token: "com.slotgame.level11") {
                utility.popUpAlert(title : "Congrats", message : "You cleared eleventh level and won bonus roulette, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 3000
                Scoring.sharedGameData.gameLevel = 19
                myLotteryTicket()
            }
        }
        if credits >= 290001 && credits <= 320000{
            Levellabel.text = "LEVEL 20"
            DispatchQueue.once(token: "com.slotgame.level11") {
                utility.popUpAlert(title : "Congrats", message : "You cleared eleventh level and won bonus roulette, Lottery Ticket number is \(randomNumber())" , cancelButton : "OK", defaultButton : "cancel", ref : self)
                Scoring.sharedGameData.lotteryTickets += 1
                Scoring.sharedGameData.credits += 3000
                Scoring.sharedGameData.gameLevel = 20
                myLotteryTicket()
            }
        }
    }
    
    
    func randomNumber()-> Int{
        var random_number =  Int(arc4random_uniform(UInt32(MAX)) + UInt32(MIN));
         let number  = String(format: "%@", "\(random_number)")
        Scoring.sharedGameData.lotteryNumbers.append(number)
        print(Scoring.sharedGameData.lotteryNumbers)
        return random_number
        
    }
    
    func  myLotteryTicket() {
        
        DispatchQueue.main.async { [unowned self] in
            let homeViewObj = TicketViewController.init(nibName: "TicketViewController", bundle: nil)
            self.navigationController?.pushViewController(homeViewObj, animated: false)
        }
        
        
        
    }
    
}
extension GameViewController : ZCSlotMachineDataSource
{
    func iconsForSlots(in slotMachine: ZCSlotMachine!) -> [Any]! {
      return _slotIcons
    }
    
    func numberOfSlots(in slotMachine: ZCSlotMachine!) -> UInt {
        return 5
    }
    
    func slotWidth(in slotMachine: ZCSlotMachine!) -> CGFloat {
        return 100.0
    }
    
    func slotSpacing(in slotMachine: ZCSlotMachine!) -> CGFloat {
        return 16
    }
}

extension GameViewController : UITableViewDataSource
{
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if tableView.tag == 100 {
         return tableIntRight.count
       }else{
         return tableIntRight.count
        }
        
       
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "numberCell", for: indexPath) as! NumberCell
    
        if tableView.tag == 100 {
            let stringValue  = String(tableIntRight[indexPath.row])
            cell.numberLbl?.text = stringValue
        }else{
            let stringValue  = String(tableIntRight[indexPath.row])
            cell.numberLbl?.text = stringValue
        }
        
        return cell
        
    }
    
}
extension GameViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 20
    }
    
}

public extension DispatchQueue {
    
    private static var _onceTracker = [String]()
    
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
     
     - parameter token: A unique reverse DNS style name such as com.vectorform.<name> or a GUID
     - parameter block: Block to execute once
     */
    public class func once(token: String, block:@noescape(Void)->Void) {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        
        if _onceTracker.contains(token) {
            return
        }
        
        _onceTracker.append(token)
        block()
    }
}

