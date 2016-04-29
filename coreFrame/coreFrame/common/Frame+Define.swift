//
//  Frame+Define.swift
//  coreFrame
//
//  Created by Apple on 16/4/29.
//  Copyright © 2016年 eyunda. All rights reserved.
//

import UIKit
let EMPTY_STRING = "" ;

let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width;
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height;

//用户代理，使用这个切换是获取 m站点 还是www站数据
let USER_AGENT = "Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4";
let MOBILE_CLIENT_HEADERS = ["user-agent":USER_AGENT]