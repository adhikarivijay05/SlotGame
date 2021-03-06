//
//  GridLayout.swift
//  SlotGame
//
//  Created by Nivesh on 27/05/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit

class GridLayout: UICollectionViewFlowLayout {

    let innerSpace: CGFloat = 1.0
    let numberOfCellsOnRow: CGFloat = 3
   
    override init() {
        super.init()
        self.minimumLineSpacing = innerSpace
        self.minimumInteritemSpacing = innerSpace
        
        
    }
    func setDirection(direction : Bool) {
        if direction {
            self.scrollDirection = .vertical
        }else{
            self.scrollDirection = .horizontal
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    func itemWidth() -> CGFloat {
        return (collectionView!.frame.size.width/self.numberOfCellsOnRow)-self.innerSpace
    }
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width:itemWidth(), height:itemWidth())
        }
        get {
            return CGSize(width:itemWidth(),height:itemWidth())
        }
    }
    
    
}
