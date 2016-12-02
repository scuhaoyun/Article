//
//  TaskStatus.swift
//  M3CSim
//
//  Created by 郝赟 on 16/11/30.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
/**
 *  任务执行状态
 */
enum TaskStatus{
    case Created
    case Schedule
    case Transfer
    case InExec
    case Failed
    case Succeed
    case Canceled
    case Paused
    case Resumed
}