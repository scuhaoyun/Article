//
//  Cloudlet.swift
//  M3CSim
//
//  Created by 郝赟 on 16/11/30.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
class Cloudlet:SimEntity{
    var schedulerTaskQueue:TaskQueue!        //待调度任务队列
    var executionTaskQueue:TaskQueue!        //待处理任务队列
    var completedTaskQueue:TaskQueue!        //已完成任务队列
    var bwProvisioner:BwProvisioner!         //Cloudlet带宽管理器
    var hostList:HostList!                   //Cloudlet所属的主机序列
    var statisticsData:CloudletStatisticsData! //Cloudlet上的各项统计数据
    override init(){
        
    }

}