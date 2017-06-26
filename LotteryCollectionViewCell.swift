//
//  LotteryCollectionViewCell.swift
//  SlotGame
//
//  Created by Nitin Chauhan on 18/05/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit

class LotteryCollectionViewCell: UICollectionViewCell {

    var imageView: UIImageView!
       var labelText: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = false
        contentView.addSubview(imageView)
        
        labelText = UILabel()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var frame = imageView.frame
        frame.size.height = self.frame.size.height
        frame.size.width = self.frame.size.width
        frame.origin.x = 0
        frame.origin.y = 0
        imageView.frame = frame
        
        var frame1 = labelText.frame
        frame1.size.height = self.imageView.frame.size.height - 10
        frame1.size.width = self.imageView.frame.size.width
        frame1.origin.x = 0
        frame1.origin.y = 0
        labelText.frame = frame
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
