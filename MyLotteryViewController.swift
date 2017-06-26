//
//  MyLotteryViewController.swift
//  SlotGame
//
//  Created by Nitin Chauhan on 18/05/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit

class MyLotteryViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var gridCollectionView: UICollectionView!
    var gridLayout: Lotteryflow!
    var fullImageView: UIImageView!
    
    let screenSize: CGRect = UIScreen.main.bounds
    private let cellReuseIdentifier = "mapCollectionViewCell"
    
     var lotteryArray: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lotteryArray = Scoring.sharedGameData.lotteryNumbers
        
        gridLayout = Lotteryflow()
        gridLayout .setDirection(direction: true)
        /*
        gridCollectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: gridLayout)
        gridCollectionView.backgroundColor = UIColor.orange
        gridCollectionView.showsVerticalScrollIndicator = false
        gridCollectionView.showsHorizontalScrollIndicator = false
        self.view.addSubview(gridCollectionView)
        */
        collectionView.collectionViewLayout =  gridLayout
        collectionView!.register(mapCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        fullImageView = UIImageView()
        fullImageView.contentMode = .scaleAspectFit
        fullImageView.backgroundColor = UIColor.lightGray
        fullImageView.isUserInteractionEnabled = true
        fullImageView.alpha = 0
        self.view.addSubview(fullImageView)
        
        let dismissWihtTap = UITapGestureRecognizer(target: self, action: #selector(hideFullImage))
        fullImageView.addGestureRecognizer(dismissWihtTap)

        // Do any additional setup after loading the view.
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        fullImageView.frame = collectionView.frame

        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
    func showFullImage(of image:UIImage) {
        fullImageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        fullImageView.contentMode = .scaleAspectFit
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{
            self.fullImageView.image = image
            self.fullImageView.alpha = 1
            self.fullImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    func hideFullImage() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{[unowned self] in
            self.fullImageView.alpha = 0
            }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
        
    }
    
    
    
}
extension MyLotteryViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lotteryArray.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! mapCollectionViewCell
        
       
        cell.imageView.image = UIImage.init(named: "lotterybg")
       
        cell.labelText.text = lotteryArray[indexPath.row]
        return cell
    }
    /*
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! LotteryCollectionViewCell
        if let image = cell.imageView.image {
            self.showFullImage(of: image)
        } else {
            print("no photo")
        }
    }
 */
}



