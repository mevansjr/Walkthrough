//
//  MBEWalkthroughController.swift
//  Walkthrough
//
//  Created by Mark Evans on 9/2/15.
//  Copyright (c) 2015 3Advance, LLC. All rights reserved.
//

import UIKit

class MBEWalkthroughController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: Variables
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var descBackground: UIView!
    @IBOutlet weak var descAltBackground: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pageControlAlt: UIPageControl!
    @IBOutlet weak var skip: UIButton!
    @IBOutlet weak var done: UIButton!
    @IBOutlet weak var arrow: UIImageView!
    
    var primaryColor = UIColor.greenColor()
    var secondaryColor = UIColor.redColor()
    var images = [UIImage?]()
    var titles = [String]()
    var descriptions = [String]()
    var isFullScreen: Bool = false
    var showStatusBar: Bool = false
    var isFanamana: Bool = false
    var statusBarOption: WalkthroughStatusBarType = WalkthroughStatusBarType.Dark
    var statusBarStyle: UIStatusBarStyle?
    var statusBarHidden: Bool?
    
    // MARK: LifeCycle Methods
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.setupStatusBar()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.exitStatusBar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Init Methods
    
    init(walkthroughType: WalkthroughType, showStatus: Bool, statusOption: WalkthroughStatusBarType) {
        super.init(nibName: "MBEWalkthroughController", bundle: nil)
        self.showStatusBar = showStatus
        self.statusBarOption = statusOption
        self.setupView(walkthroughType)
    }
    
    init(walkthroughType: WalkthroughType, showStatus: Bool, statusOption: WalkthroughStatusBarType, primaryColor: UIColor?, secondaryColor: UIColor?) {
        super.init(nibName: "MBEWalkthroughController", bundle: nil)
        if primaryColor != nil {
            self.primaryColor = primaryColor!
        }
        if secondaryColor != nil {
            self.secondaryColor = secondaryColor!
        }
        self.showStatusBar = showStatus
        self.statusBarOption = statusOption
        self.setupView(walkthroughType)
    }
    
    init(walkthroughType: WalkthroughType, showStatus: Bool, statusOption: WalkthroughStatusBarType, primaryColor: UIColor?, secondaryColor: UIColor?, images: [UIImage?]?) {
        super.init(nibName: "MBEWalkthroughController", bundle: nil)
        if primaryColor != nil {
            self.primaryColor = primaryColor!
        }
        if secondaryColor != nil {
            self.secondaryColor = secondaryColor!
        }
        if images != nil {
            self.images.removeAll(keepCapacity: false)
            self.images = images!
        }
        self.showStatusBar = showStatus
        self.statusBarOption = statusOption
        self.setupView(walkthroughType)
    }
    
    init(walkthroughType: WalkthroughType, showStatus: Bool, statusOption: WalkthroughStatusBarType, primaryColor: UIColor?, secondaryColor: UIColor?, images: [UIImage?]?, titles: [String]?) {
        super.init(nibName: "MBEWalkthroughController", bundle: nil)
        if primaryColor != nil {
            self.primaryColor = primaryColor!
        }
        if secondaryColor != nil {
            self.secondaryColor = secondaryColor!
        }
        if images != nil {
            self.images.removeAll(keepCapacity: false)
            self.images = images!
        }
        if titles != nil {
            self.titles.removeAll(keepCapacity: false)
            self.titles = titles!
        }
        self.showStatusBar = showStatus
        self.statusBarOption = statusOption
        self.setupView(walkthroughType)
    }
    
    init(walkthroughType: WalkthroughType, showStatus: Bool, statusOption: WalkthroughStatusBarType, primaryColor: UIColor?, secondaryColor: UIColor?, images: [UIImage?]?, titles: [String]?, descriptions: [String]?) {
        super.init(nibName: "MBEWalkthroughController", bundle: nil)
        if primaryColor != nil {
            self.primaryColor = primaryColor!
        }
        if secondaryColor != nil {
            self.secondaryColor = secondaryColor!
        }
        if images != nil {
            self.images.removeAll(keepCapacity: false)
            self.images = images!
        }
        if titles != nil {
            self.titles.removeAll(keepCapacity: false)
            self.titles = titles!
        }
        if descriptions != nil {
            self.descriptions.removeAll(keepCapacity: false)
            self.descriptions = descriptions!
        }
        self.showStatusBar = showStatus
        self.statusBarOption = statusOption
        self.setupView(walkthroughType)
    }
    
    // MARK: Methods
    
    @IBAction func close() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setupStatusBar() {
        self.statusBarStyle = UIApplication.sharedApplication().statusBarStyle
        self.statusBarHidden = UIApplication.sharedApplication().statusBarHidden
        switch self.statusBarOption.rawValue {
        case WalkthroughStatusBarType.Light.rawValue:
            UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        case WalkthroughStatusBarType.Dark.rawValue:
            UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.Default, animated: true)
        default:
            UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.Default, animated: true)
        }
        if self.showStatusBar {
            UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.None)
        }
        else {
            UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.None)
        }
    }
    
    func exitStatusBar() {
        if self.statusBarStyle != nil {
            UIApplication.sharedApplication().setStatusBarStyle(self.statusBarStyle!, animated: true)
        }
        if self.statusBarHidden != nil && !self.statusBarHidden! {
            UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.Slide)
        }
    }

    func setupView(walkThroughType: WalkthroughType) {
        self.view.backgroundColor = self.primaryColor
        self.descBackground.backgroundColor = self.secondaryColor
        self.descAltBackground.backgroundColor = self.secondaryColor
        self.done.backgroundColor = self.secondaryColor
        self.descBackground.hidden = true
        
        switch walkThroughType.rawValue {
        case WalkthroughType.Fanamana.rawValue:
            self.isFanamana = true
            self.pageControl.hidden = true
            self.pageControlAlt.hidden = false
            self.descAltBackground.hidden = true
            self.descBackground.hidden = true
            self.skip.hidden = true
            self.done.hidden = false
            self.arrow.hidden = false
        case WalkthroughType.BackgroundImage.rawValue:
            print("BackgroundImage");
            self.descAltBackground.hidden = false
            self.isFullScreen = false
        case WalkthroughType.FullScreenShot.rawValue:
            print("FullScreenShot");
            self.descAltBackground.hidden = false
            self.isFullScreen = true
        default:
            print("Not init w/ WalkthroughType");
        }
        
        if self.images.count > 0 {
            self.pageControl.numberOfPages = self.images.count
            self.pageControl.currentPage = 0
            self.pageControlAlt.numberOfPages = self.images.count
            self.pageControlAlt.currentPage = 0
        }
        else {
            self.pageControl.hidden = true
            self.pageControlAlt.hidden = true
        }
        
        var nib = UINib(nibName: "MBEWalkthroughCell", bundle: nil)
        self.collectionView!.registerNib(nib, forCellWithReuseIdentifier: "MBEWalkthroughCell")
        self.collectionView!.pagingEnabled = true
        self.collectionView!.reloadData()
    }
    
    func adjustButton() {
        if !self.pageControl.hidden {
            if self.images.count > 0 {
                if self.pageControl.currentPage+1 == self.images.count {
                    skip.setTitle("Done", forState: UIControlState.Normal)
                    skip.setTitle("Done", forState: UIControlState.Highlighted)
                    skip.setTitle("Done", forState: UIControlState.Selected)
                }
                else {
                    skip.setTitle("Skip", forState: UIControlState.Normal)
                    skip.setTitle("Skip", forState: UIControlState.Highlighted)
                    skip.setTitle("Skip", forState: UIControlState.Selected)
                }
            }
            else {
                skip.setTitle("Skip", forState: UIControlState.Normal)
                skip.setTitle("Skip", forState: UIControlState.Highlighted)
                skip.setTitle("Skip", forState: UIControlState.Selected)
            }
        }
        else {
            skip.setTitle("Skip", forState: UIControlState.Normal)
            skip.setTitle("Skip", forState: UIControlState.Highlighted)
            skip.setTitle("Skip", forState: UIControlState.Selected)
        }
    }
    
    // MARK: CollectionView Methods
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.images.count > 0 {
            return self.images.count
        }
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell : MBEWalkthroughCell = collectionView.dequeueReusableCellWithReuseIdentifier("MBEWalkthroughCell", forIndexPath: indexPath) as? MBEWalkthroughCell {
            if self.isFanamana {
                if self.images.count > 0 && self.titles.count > 0 {
                    cell.setupAltCell(self.images[indexPath.row], title: self.titles[indexPath.row])
                }
            }
            else if self.isFullScreen {
                if self.images.count > 0 {
                    cell.setupFullScreenCell(self.images[indexPath.row])
                }
            }
            else {
                if self.images.count > 0 && self.titles.count > 0 && self.descriptions.count > 0 {
                    cell.setupBackgroundCell(self.images[indexPath.row], title: self.titles[indexPath.row], desc: self.descriptions[indexPath.row])
                }
                else if self.images.count > 0 && self.titles.count == 0 && self.descriptions.count > 0 {
                    cell.setupBackgroundCell(self.images[indexPath.row], title: nil, desc: self.descriptions[indexPath.row])
                }
                else if self.images.count > 0 && self.titles.count > 0 && self.descriptions.count == 0 {
                    cell.setupBackgroundCell(self.images[indexPath.row], title: self.titles[indexPath.row], desc: nil)
                }
                else if self.images.count > 0 {
                    cell.setupBackgroundCell(self.images[indexPath.row], title: nil, desc: nil)
                }
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // did select
    }
    
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize {
        return self.customCellSizeWithNumColumns(collectionView, columns: 1, rows: 1)
    }
    
    func customCellSizeWithNumColumns(collectionView: UICollectionView, columns: Float, rows: Float) -> CGSize {
        let w = collectionView.bounds.size.width / CGFloat(columns)
        let h = collectionView.bounds.size.height / CGFloat(rows)
        return CGSizeMake(w, h)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageWidth = self.collectionView.bounds.size.width
        self.pageControl.currentPage = Int((self.collectionView.contentOffset.x + CGFloat(pageWidth) / 2) / CGFloat(pageWidth))
        self.pageControlAlt.currentPage = Int((self.collectionView.contentOffset.x + CGFloat(pageWidth) / 2) / CGFloat(pageWidth))
        self.adjustButton()
    }
    
    // MARK: Enums
    
    enum WalkthroughStatusBarType: Int {
        case Light = 1
        case Dark = 0
    }
    
    enum WalkthroughType: Int {
        case Fanamana = 2
        case BackgroundImage = 1
        case FullScreenShot = 0
    }
}
