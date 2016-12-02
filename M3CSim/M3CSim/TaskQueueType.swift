//
//  TaskQueueType.swift
//  M3CSim
//
//  Created by 郝赟 on 16/12/1.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
/**
 *  cloudlet中的任务队列类型
 *  Network 网络传输任务队列
 *  Scheduler cloudlet调度任务队列
 *  Execution cloudlet处理任务队列
 */
enum TaskQueueType {
    case Network
    case Scheduler
    case Execute
    case Completed
}