//
//  ClientViewController.swift
//  coreFrame
//
//  Created by Apple on 16/5/12.
//  Copyright © 2016年 eyunda. All rights reserved.
//

import UIKit

class ClientViewController: UIViewController, SocketClientDelegate{

    let hostName = "127.0.0.1"
    let hostPort:UInt16 = 10186
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SocketClient.sharedInstance.connectWithHost(hostName, port: hostPort)
        sendData("test");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func didConnectWithError(error:NSError) -> Void{
        print(error.localizedDescription)
    }
    
    func didConnectToHost(host:String, port:UInt16) -> Void{
        print("connect success")
    }
    
    func didReceiveData(data:NSData, tag:UInt) -> Void{
        // 1 获取客户的发来的数据 ，把 NSData 转 NSString
        let readClientDataString: NSString? = NSString(data: data, encoding: NSUTF8StringEncoding)
        print(readClientDataString!)
    }
    
    func sendData(msg:String){
        let serviceStr: NSMutableString = NSMutableString()
        serviceStr.appendString(msg)
        serviceStr.appendString("\n")
        SocketClient.sharedInstance.writeData(serviceStr.dataUsingEncoding(NSUTF8StringEncoding)!, timeout: -1, tag: 0)
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
