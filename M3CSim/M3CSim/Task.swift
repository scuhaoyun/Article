//
//  Task.swift
//  M3CSim
//
//  Created by 郝赟 on 16/11/30.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
class Task:SimEntity {
    var userId:Int                           //任务所属用户Id
    var cloudletId:Int                       //任务所属cloudletId
    var taskLength:Float                     //任务处理长度
    var taskCinSize:Float                    //任务需要输入数据长度
    var taskCoutSize:Float                   //任务输出数据长度
    var excResources:ExecutionResource       //任务执行所需资源
    var status:TaskStatus                    //任务状态
    var taskLever:TaskTargetLever            //任务调度多个目标各自对应系数
    var taskPhaseTime:TaskPhaseTime          //任务各个阶段所对应的时间
    var finishedLengthSoFar:Float            //任务目前为止已经处理完成的任务长度
    var transferedLenghthSoFar:Float         //任务目前为止已经传输完成的任务长度
    init(cloudletId:Int,
        taskLength:Float,
        taskCinSize:Float,
        taskCoutSize:Float,
        excResources:ExecutionResource,
        taskLever:TaskTargetLever){
            self.cloudletId = cloudletId
            self.taskLength = taskLength
            self.taskCinSize = taskCinSize
            self.taskCoutSize = taskCoutSize
            self.excResources = excResources
            self.taskLever = taskLever
            self.userId = 0
            self.status = TaskStatus.Created
            self.taskPhaseTime = TaskPhaseTime()
            self.finishedLengthSoFar = 0
            self.transferedLenghthSoFar = 0
    }
}