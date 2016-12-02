//
//  TaskTargetLever.swift
//  M3CSim
//
//  Created by 郝赟 on 16/11/30.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
/**
 *  任务调度多个目标分别对应的权重系数
 */
struct TaskTargetLever {
    var responseTimeLever:Float
    var loadBalanceLever:Float
    var totalCostLever:Float
    var successRateLever:Float
    /**
     *  调用构造函数会根据各个参数的阈值随机产生响应的值，并生成一个随机对象
     */
    init(){
        responseTimeLever = RandomMath.randomFloat(min: Constants.minResponseTimeLever, max: Constants.maxResponseTimeLever)
        loadBalanceLever = RandomMath.randomFloat(min: Constants.minLoadBalanceLever, max: Constants.maxLoadBalanceLever)
        totalCostLever = RandomMath.randomFloat(min: Constants.minTotalCostLever, max: Constants.maxTotalCostLever)
        successRateLever = RandomMath.randomFloat(min: Constants.minSuccessRateLever, max: Constants.maxSuccessRateLever)
    }
    
    /**
     *  根据任务的调度各个目标权重系数生成调度优先级
     *
     *  @param taskLever:TaskTargetLever 任务调度各个目标权重对象
     *
     *  @return 调度优先级
     */
    func getSchedulerPriority()->Float{
        return 0
    }
}