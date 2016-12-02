//
//  Log.swift
//  M3CSim
//
//  Created by 郝赟 on 16/11/30.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
class Log:NSObject {
    class func printFormate(printStr:String){
        print(printStr+"            \(NSDate().toFormatString())\n")
    }
}