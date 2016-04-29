//
//  ViewController.swift
//  coreFrame
//
//  Created by Apple on 16/4/29.
//  Copyright © 2016年 eyunda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var crashViewBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickBtn(sender: UIButton) {
        let vc = CrashTestController()
        self.presentViewController(vc, animated: true) {}
        return
    }

}

