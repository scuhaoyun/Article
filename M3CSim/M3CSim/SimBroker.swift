//
//  SimEntity.swift
//  M3CSim
//
//  Created by 郝赟 on 16/11/30.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
protocol runnable{
    func run()
    func stop()
}
class SimBroker:NSObject,runnable{
    var running:Bool = false
    func run() {
        
    }
    func stop() {
        
    }
}