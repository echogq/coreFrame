//
//  CrashTestController.swift
//  coreFrame
//
//  Created by Apple on 16/4/29.
//  Copyright © 2016年 eyunda. All rights reserved.
//

import UIKit
import Crashlytics

class CrashTestController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let button = UIButton(type: UIButtonType.RoundedRect)
        button.frame = CGRectMake(20, 50, 100, 30)
        button.setTitle("Crash", forState: UIControlState.Normal)
        button.addTarget(self, action: #selector(CrashTestController.crashButtonTapped(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)

    }
    
    @IBAction func crashButtonTapped(sender: AnyObject) {
        Crashlytics.sharedInstance().crash()
    }


}
