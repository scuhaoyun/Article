//
//  CloudletStatistics.swift
//  M3CSim
//
//  Created by 郝赟 on 16/12/2.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
/**
 *  Cloudlet上的各项统计数据
 */
struct CloudletStatisticsData {
    var curWorkload:Float!                   //Cloudlet上当前负载(任务量)
    var curSuccessRate:Float!                //Cloudlet上当前任务成功率
    var avgResponseTime:Float!               //Cloudlet上当前任务平均响应时间
    var avgExecutionCost:Float!              //Cloudlet上当前任务平均执行开销
}