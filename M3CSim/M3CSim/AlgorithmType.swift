//
//  File.swift
//  M3CSim
//
//  Created by 郝赟 on 16/12/1.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
/**
 *  cloudlet类型:应用于哪种算法
 *  Random:随机算法，任务将随机调度到cloudlet
 *  NCFS:(Nearest-Cloudlet First Scheduler)调度到最近的Cloudlet
 *  RCFS:(Richest-Cloudlet First Scheduler)调度到处理能力最强的Cloudlet
 */
enum AlgorithmType:Int {
    case Random = 0
    case NCFS = 1
    case RCFS = 2
    case GAPA = 3
}