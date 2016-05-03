//
//  SocketViewController.swift
//  coreFrame
//
//  Created by Apple on 16/4/29.
//  Copyright © 2016年 eyunda. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class SocketViewController: UIViewController, GCDAsyncUdpSocketDelegate{
    var ssdpAddres          = "www.eyd98.com"
    var ssdpPort:UInt16     = 10168
    var ssdpSocket:GCDAsyncUdpSocket!
    var ssdpSocketRec:GCDAsyncUdpSocket!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        ssdpSocket = GCDAsyncUdpSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
//        //replace ST:roku:ecp with ST:ssdp:all to view all devices
//        let data = "M-SEARCH * HTTP/1.1\r\nHOST: 239.255.255.250:1900\r\nMAN: \"ssdp:discover\"\r\nMX: 3\r\nST: roku:ecp\r\nUSER-AGENT: iOS UPnP/1.1 TestApp/1.0\r\n\r\n".dataUsingEncoding(NSUTF8StringEncoding)
//        
//        do {
//            
//            ssdpSocket.sendData(data, toHost: ssdpAddres, port: ssdpPort, withTimeout: 1, tag: 0)
//            
//            try ssdpSocket.bindToPort(ssdpPort)
//            try ssdpSocket.joinMulticastGroup(ssdpAddres)
//            try ssdpSocket.beginReceiving()
//            
//        } catch let error as NSError{
//            print("服务器返回错误：\(error)")
//        }
        
        SocketClient.sharedInstance.connectWithHost(ssdpAddres, port: ssdpPort)
        let result = SocketClient.sharedInstance.isConnected()
        print(result)

        
        
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didConnectToAddress address: NSData!) {
        
        print("connect Success")
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didReceiveData data: NSData!, fromAddress address: NSData!, withFilterContext filterContext: AnyObject!) {
        let gotdata: NSString = NSString(data: data!, encoding: NSUTF8StringEncoding)!
        print(gotdata)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
