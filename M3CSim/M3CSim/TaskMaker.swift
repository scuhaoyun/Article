//
//  TaskMaker.swift
//  M3CSim
//
//  Created by 郝赟 on 16/11/30.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
class TaskMaker: SimBroker {
    /**
     *  cloudlet的任务分配累积概率(权重)数组
     */
    var cumulativeProbabilityOfCloudlets:[Float]!
    /**
     *  M3C系统内的用户数量，TaskMaker将根据不同的用户数量产生不同数量的任务
     */
    var userNumber:Float!
    /**
     *  M3C系统内每个用户任务平均产生速度
     */
    var avgTaskRate:Float!
    /**
     *  M3C系统内目前总的任务数量
     */
    var totalTaskNumber:Int!
    
    override init() {
        cumulativeProbabilityOfCloudlets = GlobalHandler.getCumulativeProbabilityOfCloudlets(Constants.cloudletNumber)
    }
    override func run() {
        
    }
    override func stop() {
        
    }
    /**
     *  线程中运行的循环产生任务的函数，该过程为随机产生一个任务，将该任务深复制4份分别分发到4个不同的Cloudlet上
     *  首先产生服从泊松分布的任务数量，再依次产生任务
     *  @return void
     */
    func circulationInBackgroud(){
        while running {
            let startTime = NSDate()
            let taskNumber = RandomMath.possionNum(userNumber*avgTaskRate)
            for _ in 0 ... taskNumber-1 {
                let newTask = generateTask()
                newTask.id = totalTaskNumber + 1
                totalTaskNumber = totalTaskNumber +  1
                for i in 0...3 {
                    let cloneTask = newTask.mutableCopy() as! Task
                    cloneTask.algorithmType = AlgorithmType(rawValue: i)!
                    putTaskToCloudlet(cloneTask)
                }
            }
            let endTime = NSDate()
            let leftSeconds = endTime.timeIntervalSinceDate(startTime)
            Log.printFormate("产生一个周期的任务花了 \(leftSeconds) 秒")
            NSThread.sleepForTimeInterval(1.0-leftSeconds)
        }
    }
    /**
     *  随机产生一个任务，并根据cloudlet的任务分配累积概率数组随机产生该任务所属的CloudletId
     *
     *  @return 产生的任务对象
     */
    func generateTask()->Task {
        let cloudletId = RandomMath.indexForRoulette(cumulativeProbability: cumulativeProbabilityOfCloudlets)
        let taskLength = RandomMath.randomFloat(min: Constants.minTaskLength, max: Constants.maxTaskLength)
        let taskCinSize = RandomMath.randomFloat(min: Constants.minTaskCinSize, max: Constants.maxTaskCinSize)
        let taskCoutSize = RandomMath.randomFloat(min: Constants.minTaskCoutSize, max: Constants.maxTaskCoutSize)
        let task = Task(cloudletId: cloudletId, taskLength: taskLength, taskCinSize: taskCinSize, taskCoutSize: taskCoutSize, excResources: ExecutionResource(), taskLever: TaskTargetLever())
        return task
    }
    /**
     *  将任务加入到cloudlet的待调度任务队列
     *
     *  @param task:Task 新产生的任务
     *
     *  @return void
     */
    func putTaskToCloudlet(task:Task) {
        let targetCloudlet = GlobalHandler.getCloudlet(cloudletId: task.cloudletId, algorithmType:task.algorithmType)
        targetCloudlet.schedulerTaskQueue.inQueue(task)
    }
    
}