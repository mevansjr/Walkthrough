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
        let images = [UIImage(named: "1f"), UIImage(named: "2fw"), UIImage(named: "3f"), UIImage(named: "4fw"), UIImage(named: "5f")] // alt
        let titles = ["Join one of our free or pay-to-enter Contests, or if MLB hasn’t started yet today, play a Practice game.", "On joining a contest, the boxscore is linked to the full leaderboard. Your game starts when you make your first pick.", "Draft from the current slate of on-deck batters. These are players preparing to bat in live MLB games.", "When a player is at-bat in the real game, his outcome will apply to your virtual game. We go by runs and outs, just like baseball.", "Good luck and enjoy playing InGame Fantasy. Remember when a friend you refer makes a deposit, you’ll get paid too!"]
        
        let walkthroughController = MBEWalkthroughController(walkthroughType: MBEWalkthroughController.WalkthroughType.Fanamana, showStatus: false, statusOption: MBEWalkthroughController.WalkthroughStatusBarType.Light, primaryColor: UIColor.blackColor(), secondaryColor: UIColor.greenColor(), images: images, titles: titles)
        
        self.presentViewController(walkthroughController, animated: true, completion: nil)
    }

}
