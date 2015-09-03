//
//  MBEWalkthroughCell.swift
//  Walkthrough
//
//  Created by Mark Evans on 9/2/15.
//  Copyright (c) 2015 3Advance, LLC. All rights reserved.
//

import UIKit

class MBEWalkthroughCell: UICollectionViewCell {

    @IBOutlet weak var screenImageView: UIImageView!
    @IBOutlet weak var title: UILabel?
    @IBOutlet weak var descr: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(image: UIImage?, title: String?) {
        self.screenImageView.hidden = false
        
        if image != nil {
            self.screenImageView.image = image!
        }
        
        self.title?.hidden = true
        if title != nil {
            self.title?.text = title!
        }
    }
}
