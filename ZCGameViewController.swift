//
//  ZCGameViewController.swift
//  SlotGame
//
//  Created by Nitin Chauhan on 21/03/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit

class ZCGameViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {
 @IBOutlet var carousel: iCarousel!
    var items: [Int] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    var gridLayout: GridLayout!
    @IBOutlet var creditLbl:UILabel!
    @IBOutlet var countDownLabel: UILabel!
    
    @IBOutlet var levellbl: UILabel!
    @IBOutlet var levelNumber: UILabel!
    
    var count = 3590
    var _slotIcons: [UIImage] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        creditLbl.text = String(format: "%@ Credits", "\(Scoring.sharedGameData.credits)")
        /*
        carousel.type = .linear
        for i in 1 ... 10 {
            items.append(i)
        }
        carousel.reloadData()
        */
        
        gridLayout = GridLayout()
        gridLayout .setDirection(direction: false)
        collectionView.collectionViewLayout =  gridLayout
        collectionView!.register(LotteryCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        createArray()
        collectionView.reloadData()
        
        var _ = Timer.scheduledTimer(timeInterval:1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        
        //self.carousel.addSubview(collectionView)
    }
    
    func createArray()  {   //->  Array<Any>
        _slotIcons.append(UIImage.init(named: "mapicon1")!)
        _slotIcons.append(UIImage.init(named: "mapicon2")!)
        _slotIcons.append(UIImage.init(named: "mapicon3")!)
        _slotIcons.append(UIImage.init(named: "mapicon4")!)
        _slotIcons.append(UIImage.init(named: "mapicon5")!)
        _slotIcons.append(UIImage.init(named: "mapicon6")!)
        _slotIcons.append(UIImage.init(named: "mapicon7")!)
        _slotIcons.append(UIImage.init(named: "mapicon8")!)
        _slotIcons.append(UIImage.init(named: "mapicon9")!)
        _slotIcons.append(UIImage.init(named: "mapicon10")!)
      
        // return _slotIcons
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        levellbl.text = String(format: "Level %@", "\(Scoring.sharedGameData.gameLevel)")

        levelNumber.text = String(format: "%@", "\(Scoring.sharedGameData.winningPoints)")
        
    }
    
    
    func update() {
        if(count > 0) {
           // countDownLabel.text = String(count--)
            let hours = String(count / 3600)
            let minutes = String(count / 60)
            let seconds = String(count % 60)
            countDownLabel.text = hours + ":" + minutes + ":" + seconds
            count -= 1
            //countDownLabel.text = "\(count)"
            //count -= 1
        }
    }
    
     @IBAction func countDownClicked(_ sender: Any) {
        
        if count == 0{
            
            Scoring.sharedGameData.credits = Scoring.sharedGameData.credits + 50
            creditLbl.text = String(format: "%@ Credits", "\(Scoring.sharedGameData.credits)")
            count = 3590
        }
        
       
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func homeBtnClicked(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: HomeViewController.self) {
                self.navigationController?.popToViewController(controller as UIViewController, animated: true)
                break
            }
        }
    }
    
    

    func numberOfItems(in carousel: iCarousel) -> Int {
        return items.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var carousalView: MapView
        carousalView =  MapView.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        carousalView.addCustomView(index: index, viewFrame: carousalView.frame,isStage: false, iconName : "mapicon")
        
        carousalView.addSubview(collectionView)
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
       
    }
    
    func carouselWillBeginScrollingAnimation(_ carousel: iCarousel) {
       
    }
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        
        let homeViewObj = GameViewController.init(nibName: "GameViewController", bundle: nil)
        self.navigationController?.pushViewController(homeViewObj, animated: false)
        
    }
    
 
}

extension ZCGameViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _slotIcons.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LotteryCollectionViewCell
        
        cell.imageView.image = _slotIcons[indexPath.row]
        return cell
    }
    
}
