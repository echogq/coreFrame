//
//  ViewController.swift
//  coreFrame
//
//  Created by Apple on 16/4/29.
//  Copyright © 2016年 eyunda. All rights reserved.
//

import UIKit
import MaterialKit

class ViewController: UIViewController {

    @IBOutlet weak var crashViewBtn: UIButton!
    
    @IBOutlet weak var socketViewBtn: UIButton!
    
    @IBOutlet weak var tableViewBtn: UIButton!
    
    weak var mdBtn: MKButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initViews()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func initViews() -> Void {
        
        tableViewBtn.layer.borderColor = UIColor.blueColor().CGColor
        
        initMDBtn()
        
    }
    /**
     添加MaterialDesign按钮实例
     */
    func initMDBtn() -> Void {
        mdBtn = MKButton(frame: CGRect(x: 20, y: 140, width: SCREEN_WIDTH-40, height: 35))
        mdBtn.maskEnabled = true
        mdBtn.cornerRadius = 5
        mdBtn.backgroundAnimationEnabled = true
        mdBtn.rippleEnabled = true
        mdBtn.backgroundColor = UIColor.MKColor.LightBlue.P500
        mdBtn.setTitle("MaterialDesign", forState: .Normal)
        self.view.addSubview(mdBtn)
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

    @IBAction func clickSocketBtn(sender: UIButton) {
        let vc = SocketViewController()
        self.presentViewController(vc, animated: true) {}
        return
    }
    @IBAction func clickTableView(sender: UIButton) {
        
    }
}

