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
    @IBOutlet weak var overlayScreenImageView: UIImageViewAligned!
    @IBOutlet weak var overlay: UIImageView!
    @IBOutlet weak var title: UILabel?
    @IBOutlet weak var descr: UILabel?
    @IBOutlet weak var extendDesc: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if Constants.IS_IPHONE_4 {
            self.descr?.hidden = true
        }
        else if Constants.IS_IPHONE_6 || Constants.IS_IPHONE_6_PLUS {
            self.extendDesc?.hidden = false
            self.extendDesc?.text = self.descr!.text
            self.descr?.hidden = true
        }
    }
    
    func setupAltCell(image: UIImage?, title: String?) {
        self.screenImageView.hidden = false
        self.overlay.hidden = true
        self.overlayScreenImageView.hidden = true
        
        if image != nil {
            self.screenImageView.image = image!
        }
        
        self.title?.hidden = true
        if title != nil {
            self.title?.text = title!
        }
    }

    func setupBackgroundCell(image: UIImage?, title: String?, desc: String?) {
        self.screenImageView.hidden = true
        self.overlay.hidden = false
        self.overlayScreenImageView.hidden = false
        self.overlayScreenImageView.alignTop = true
        
        if image != nil {
            self.overlayScreenImageView.image = image!
        }
        
        if title != nil {
            self.title?.text = title!
        }
        
        if desc != nil {
            self.descr?.text = desc!
        }
        
        if Constants.IS_IPHONE_4 {
            self.descr?.hidden = true
        }
        else if Constants.IS_IPHONE_6 || Constants.IS_IPHONE_6_PLUS {
            self.extendDesc?.hidden = false
            self.extendDesc?.text = self.descr!.text
            self.descr?.hidden = true
        }
    }
    
    func setupFullScreenCell(image: UIImage?) {
        self.screenImageView.hidden = false
        self.overlay.hidden = true
        self.overlayScreenImageView.hidden = true
        
        if image != nil {
            self.screenImageView.image = image!
        }
    }
}
