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
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var finish: UIButton!
    @IBOutlet weak var skip: UIButton!
    @IBOutlet weak var contentBackground: UIButton!
    @IBOutlet weak var content: UILabel!
    
    var primaryColor = UIColor.whiteColor()
    var secondaryColor = UIColor.whiteColor()
    var images = [UIImage?]()
    var titles = [String]()
    var descriptions = [String]()
    var showStatusBar: Bool = false
    var isFanamana: Bool = false
    var statusBarOption: WalkthroughStatusBarType = WalkthroughStatusBarType.Light
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
        finish.enabled = false
        
        switch walkThroughType.rawValue {
        case WalkthroughType.Fanamana.rawValue:
            self.isFanamana = true
            self.pageControl.hidden = false
            self.finish.hidden = false
            self.contentBackground.hidden = false
            self.content.hidden = false
            
            if self.titles.count > 0 {
                self.content.text = self.titles[0]
            }
        default:
            print("Not init w/ WalkthroughType");
        }
        
        if self.images.count > 0 {
            self.pageControl.numberOfPages = self.images.count
            self.pageControl.currentPage = 0
        }
        else {
            self.pageControl.hidden = true
        }
        
        var nib = UINib(nibName: "MBEWalkthroughCell", bundle: nil)
        self.collectionView!.registerNib(nib, forCellWithReuseIdentifier: "MBEWalkthroughCell")
        self.collectionView!.pagingEnabled = true
        self.collectionView!.reloadData()
    }
    
    func adjustFinishButton() {
        skip.hidden = false
        if !self.pageControl.hidden {
            if self.images.count > 0 {
                if self.pageControl.currentPage+1 == self.images.count {
                    finish.setTitle("Let Me In".uppercaseString, forState: UIControlState.Normal)
                    finish.setTitle("Let Me In".uppercaseString, forState: UIControlState.Highlighted)
                    finish.setTitle("Let Me In".uppercaseString, forState: UIControlState.Selected)
                    finish.enabled = true
                    skip.hidden = true
                }
                else {
                    finish.setTitle("".uppercaseString, forState: UIControlState.Normal)
                    finish.setTitle("".uppercaseString, forState: UIControlState.Highlighted)
                    finish.setTitle("".uppercaseString, forState: UIControlState.Selected)
                    finish.enabled = false
                }
            }
            else {
                finish.setTitle("".uppercaseString, forState: UIControlState.Normal)
                finish.setTitle("".uppercaseString, forState: UIControlState.Highlighted)
                finish.setTitle("".uppercaseString, forState: UIControlState.Selected)
                finish.enabled = false
            }
        }
        else {
            finish.setTitle("".uppercaseString, forState: UIControlState.Normal)
            finish.setTitle("".uppercaseString, forState: UIControlState.Highlighted)
            finish.setTitle("".uppercaseString, forState: UIControlState.Selected)
            finish.enabled = false
        }
    }
    
    func adjustSkipButton() {
        skip.setTitle("Skip".uppercaseString, forState: UIControlState.Normal)
        skip.setTitle("Skip".uppercaseString, forState: UIControlState.Highlighted)
        skip.setTitle("Skip".uppercaseString, forState: UIControlState.Selected)
        skip.enabled = true
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
                    cell.setupCell(self.images[indexPath.row], title: self.titles[indexPath.row])
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
        let index = Int((self.collectionView.contentOffset.x + CGFloat(pageWidth) / 2) / CGFloat(pageWidth))
        self.pageControl.currentPage = index
        if self.isFanamana {
            if self.titles.count > 0 {
                self.content.text = self.titles[index]
            }
        }
        self.adjustSkipButton()
        self.adjustFinishButton()
    }
    
    // MARK: Enums
    
    enum WalkthroughStatusBarType: Int {
        case Light = 1
        case Dark = 0
    }
    
    enum WalkthroughType: Int {
        case Fanamana = 0
    }
}
