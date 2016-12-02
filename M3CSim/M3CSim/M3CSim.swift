//
//  M3CSim.swift
//  M3CSim
//
//  Created by 郝赟 on 16/11/30.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
class M3CSim{
    var running:Bool = false   //程序运行状态标志
    var startDate:NSDate?      //程序开始运行时间
    var endDate:NSDate?        //程序结束运行时间
    var brokers:[SimBroker]?   //程序中进行独自管理的对象（已对象是否占用一个线程区分）
    
    init(){
        Log.printFormate("Simulation Initialising...")
    }
    
    func startSimulation(){
        Log.printFormate("Simulation Start!")
       
    }
    func stopSimulation(){
        Log.printFormate("Simulation Stop!")
    }
    func terminateSimulation(){
       running = false
    }
}