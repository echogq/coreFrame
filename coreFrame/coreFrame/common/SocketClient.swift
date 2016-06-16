//
//  SocketClient.swift
//  coreFrame
//
//  Created by Apple on 16/4/29.
//  Copyright © 2016年 eyunda. All rights reserved.
//

import Foundation
import CocoaAsyncSocket

protocol SocketClientDelegate {
    func didConnectWithError(error:NSError) -> Void
    func didConnectToHost(host:String, port:UInt16) -> Void
    func didReceiveData(data:NSData, tag:UInt) -> Void
    
}

class SocketClient: NSObject{
    
    static let sharedInstance = SocketClient()
    
    var _delegate:SocketClientDelegate?
    private var _asyncSocket:GCDAsyncSocket?
    
    override private init() {
        super.init()
        if (self._asyncSocket) == nil{
            self._asyncSocket = GCDAsyncSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        }
    }
    
    func connectWithHost(hostName:String, port:UInt16) -> Void{
        if !((_asyncSocket?.isConnected)!) {
            do {
                try _asyncSocket?.connectToHost(hostName, onPort: port)
            
            } catch let error as NSError{
                print("服务器返回错误：\(error)")
            }
        }

    }
    
    func disconnect() -> Void {
        _asyncSocket?.disconnect()
    }
    
    func isConnected() -> Bool {
        return (_asyncSocket?.isConnected)!
    }
 
    
    func  readDataWithTimeOut(timeout:NSTimeInterval,tag:Int) -> Void {
        _asyncSocket?.readDataWithTimeout(timeout, tag: tag)
    }
    
    func writeData(data:NSData, timeout:NSTimeInterval, tag:Int) -> Void {
        _asyncSocket?.writeData(data, withTimeout: timeout, tag: tag)
    }
}