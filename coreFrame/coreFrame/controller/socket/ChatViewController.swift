//
//  ChatViewController.swift
//  coreFrame
//
//  Created by Apple on 16/5/11.
//  Copyright © 2016年 eyunda. All rights reserved.
//

import UIKit
import CocoaAsyncSocket
import SVProgressHUD

class ChatViewController: UIViewController,GCDAsyncSocketDelegate {
    var serverAddres        = "127.0.0.1"
    var serverPort:UInt16     = 10168
    var clientSocket:GCDAsyncSocket!
    var mainQueue = dispatch_get_main_queue()
    
    @IBOutlet weak var severTextView: UITextField!
    @IBOutlet weak var serverPortTextView: UITextField!

    @IBOutlet weak var connectStatus: UILabel!
    
    @IBOutlet weak var messageBox: UITextField!
    @IBOutlet weak var resultBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.setBackgroundColor(UIColor.blackColor())
        SVProgressHUD.setForegroundColor(UIColor.whiteColor())
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func connectServer(sender: UIButton) {
        let addr = self.severTextView.text!
        let port = self.serverPortTextView.text!
        if(!addr.isEmpty){
            serverAddres = self.severTextView.text!
        }
        if(!port.isEmpty){
            serverPort = UInt16(port)!
        }
        self.initClient()
    }
    
    @IBAction func sendDataToServer(sender: UIButton) {
        if let _ = clientSocket{
            if(clientSocket.isConnected){
                let msg = messageBox.text!
                if(!msg.isEmpty){
                    print(msg)
                    self.sendData(msg)
                }else{
                    SVProgressHUD.showErrorWithStatus("未填入内容")
                }
            }else{
                SVProgressHUD.showErrorWithStatus("服务器未连接")
                print("服务器未连接")
            }
        }else{
            SVProgressHUD.showErrorWithStatus("先点击连接服务器")
        }
    }
    
    func initClient(){
        do{
            clientSocket = GCDAsyncSocket()
            clientSocket.delegate = self
            clientSocket.delegateQueue = dispatch_get_global_queue(0, 0)
            try clientSocket.connectToHost(serverAddres, onPort: serverPort)
            if clientSocket.isConnected {
                connectStatus.text = "\(serverAddres):\(serverPort)连接成功"
            }else{
                connectStatus.text = "\(serverAddres):\(serverPort)连接失败"
            }
        }catch{
            print("connet to server errror")
            connectStatus.text = "\(serverAddres):\(serverPort)连接失败"
        }
    }
    
    func socket(sock: GCDAsyncSocket!, didConnectToHost host: String!, port: UInt16) {
        print("与服务器连接成功！")
        clientSocket.readDataWithTimeout(-1, tag: 0)
    }
    /**
     断开连接操作
     
     - parameter sock: socket实例
     - parameter err:  错误消息
     */
    func socketDidDisconnect(sock: GCDAsyncSocket!, withError err: NSError!){
         print("与服务器断开连接")
    }
    /**
     接收数据处理
     
     - parameter sock: sock实例
     - parameter data: 传输数据
     - parameter tag:  数据标签
     */
    func socket(sock: GCDAsyncSocket!, didReadData data: NSData!, withTag tag: Int) {
        // 1 获取客户的发来的数据 ，把 NSData 转 NSString
        let readClientDataString: NSString? = NSString(data: data, encoding: NSUTF8StringEncoding)
        print(readClientDataString!)
        
        // 2 主界面ui 显示数据
        dispatch_async(mainQueue, {
            
            let showStr: NSMutableString = NSMutableString()
            //showStr.appendString(self.msgView.text)
            showStr.appendString(readClientDataString! as String)
            showStr.appendString("\n")
            //self.msgView.text = showStr as String
            
        })
        
        // 3.处理请求，返回数据给客户端 ok
        let serviceStr: NSMutableString = NSMutableString()
        serviceStr.appendString("ok\n")
        clientSocket.writeData(serviceStr.dataUsingEncoding(NSUTF8StringEncoding), withTimeout: -1, tag: 0)
        
        // 4 每次读完数据后，都要调用一次监听数据的方法
        clientSocket.readDataWithTimeout(-1, tag: 0)
    }
    /**
      发送数据到服务端
     
     - parameter msg: 消息内容
     */
    func sendData(msg:String){
        let serviceStr: NSMutableString = NSMutableString()
        serviceStr.appendString(msg)
        serviceStr.appendString("\n")
        clientSocket.writeData(serviceStr.dataUsingEncoding(NSUTF8StringEncoding), withTimeout: -1, tag: 0)
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
