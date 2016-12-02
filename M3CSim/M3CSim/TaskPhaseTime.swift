//
//  TaskPhaseTime.swift
//  M3CSim
//
//  Created by 郝赟 on 16/12/2.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
struct TaskPhaseTime {
    var createdTime:NSDate?                 //任务创建时间
    var scheduleTime:NSDate?                //任务开始执行调度算法时间
    var transferTime:NSDate?                //任务开始传输时间
    var excecuteTime:NSDate?                //任务开始执行时间
    var completedTime:NSDate?               //任务完成时间
    init(){
        createdTime = NSDate()
    }
}