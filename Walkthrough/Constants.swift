//
//  Constants.swift
//  Cover5
//
//  Created by Mark Evans on 5/14/15.
//  Copyright (c) 2015 3Advance, LLC. All rights reserved.
//

import UIKit

class Constants: NSObject {
   
    static var IS_IPHONE_3 : Bool = UIScreen.mainScreen().bounds.height == 480
    static var IS_IPHONE_4 : Bool = UIScreen.mainScreen().bounds.height == 960/2
    static var IS_IPHONE_5 : Bool = UIScreen.mainScreen().bounds.height == 1136/2
    static var IS_IPHONE_6 : Bool = UIScreen.mainScreen().bounds.height == 1334/2
    static var IS_IPHONE_6_PLUS : Bool = UIScreen.mainScreen().bounds.height == 736
    
    static var IS_IPAD : Bool = UIDevice.currentDevice().userInterfaceIdiom == .Pad
    
    static var iOS8 : Bool = NSString(string: UIDevice.currentDevice().systemVersion).doubleValue >= 8
    static var iOS7 : Bool = NSString(string: UIDevice.currentDevice().systemVersion).doubleValue >= 7 && NSString(string: UIDevice.currentDevice().systemVersion).doubleValue < 8
    static var iOS6 : Bool = NSString(string: UIDevice.currentDevice().systemVersion).doubleValue >= 6 && NSString(string: UIDevice.currentDevice().systemVersion).doubleValue < 7
        
    func formatRank(number: Int) -> NSMutableString {
        var n : NSNumber = NSNumber(integer: number)
        var num = n.floatValue
        var ones = num % 10
        var tens = floor(num/10)
        tens = tens % 10
        if tens == 1 {
            return NSMutableString(string: "th")
        } else {
            switch ones {
            case 1 :
                return NSMutableString(string: "st")
            case 2 :
                return NSMutableString(string: "nd")
            case 3 :
                return NSMutableString(string: "rd")
            default :
                return NSMutableString(string: "th")
            }
        }
    }
    
    enum ViewControllerType: Int {
        case MyContestsController = 0
        case ContestController = 1
        case MenuController = 2
        case LoginController = 3
    }
    
}
