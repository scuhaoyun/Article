//
//  NSDate-extension.swift
//  M3CSim
//
//  Created by 郝赟 on 16/11/30.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
extension NSDate{
    func toFormatString()->String{
        let timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss:SSS"
        return timeFormatter.stringFromDate(self)
    }
}