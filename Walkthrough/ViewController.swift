//
//  ViewController.swift
//  Walkthrough
//
//  Created by Mark Evans on 9/2/15.
//  Copyright (c) 2015 3Advance, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fanamana() {
        let images = [UIImage(named: "Fanamana-Screen-01"), UIImage(named: "2b"), UIImage(named: "3b"), UIImage(named: "4b"), UIImage(named: "5b")]
        let titles = ["Title One", "Title Two", "Title Three", "Title Four", "Title Five"]
        
        let walkthroughController = MBEWalkthroughController(walkthroughType: MBEWalkthroughController.WalkthroughType.Fanamana, showStatus: false, statusOption: MBEWalkthroughController.WalkthroughStatusBarType.Light, primaryColor: UIColor.CustomBackgroundOffBlackColor(), secondaryColor: UIColor.CustomGreenColor(), images: images, titles: titles)
        
        self.presentViewController(walkthroughController, animated: true, completion: nil)
    }
    
    @IBAction func fullscreen() {
        let images = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5")]
        
        let walkthroughController = MBEWalkthroughController(walkthroughType: MBEWalkthroughController.WalkthroughType.FullScreenShot, showStatus: false, statusOption: MBEWalkthroughController.WalkthroughStatusBarType.Light, primaryColor: UIColor.clearColor(), secondaryColor: UIColor.darkGrayColor(), images: images)
        
        self.presentViewController(walkthroughController, animated: true, completion: nil)
    }
    
    @IBAction func background() {
        let imagesAlt = [UIImage(named: "1a"), UIImage(named: "2a"), UIImage(named: "3a"), UIImage(named: "4a"), UIImage(named: "5a")]
        let titles = ["Title One", "Title Two", "Title Three", "Title Four", "Title Five"]
        let descs = ["Description One", "Description Two", "Description Three", "Description Four", "Description Five"]
        
        let walkthroughController = MBEWalkthroughController(walkthroughType: MBEWalkthroughController.WalkthroughType.BackgroundImage, showStatus: false, statusOption: MBEWalkthroughController.WalkthroughStatusBarType.Light, primaryColor: UIColor.lightGrayColor(), secondaryColor: UIColor.darkGrayColor(), images: imagesAlt, titles: titles, descriptions: descs)
        
        self.presentViewController(walkthroughController, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
