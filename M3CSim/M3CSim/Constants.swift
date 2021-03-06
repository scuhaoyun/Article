//
//  Constants.swift
//  Simulation
//
//  Created by 郝赟 on 15/11/3.
//  Copyright © 2015年 郝赟. All rights reserved.
//

import Foundation
class Constants {
    static let APNetworkX = [70,290,440,700,860,500,860,280,440,830,60,370,580,630,110,450,750,950,1140,1080,1210,1370,1320,1215,1300,1140,1190,1090,1395,1285,800,570,750,630,360,160]
    static let APNetworkY = [770,950,950,870,960,710,700,600,430,420,250,250,320,210,120,100,40,160,50,290,200,140,345,490,675,680,890,1130,1000,1270,1180,1215,1380,1085,1330,1115]
    static let APNetWorkConnect: [[Int]] = [[2,8],[1,3,36],[2,4,6,32,34],[3,5,6,7,34],[4,7,28,31,34],[3,4,8],[4,5,26],[1,6,9],[8,12,13],[13,18,20],[12,15],[9,13,15,16],[9,10,12,14,16],[13,16,17,18],[11,12],[12,13,14,17],[14,16,18],[10,14,17,19,20],[18,21],[10,18,21,23],[19,20,22,23],[21],[20,21,24],[23,25,26],[24,26,27],[7,24,25,27],[25,26,28,29],[5,27,30,31],[27,30],[28,29],[5,28,32,33,34],[3,31,33,34,35],[31,32],[3,4,5,31,32],[32,36],[2,35]]
    static let cloudletNumber = 36
    static let RandomSendTaskRefreshTime:Float = 0.2  //随机发送任务的最小刷新时间
    static let TaskNumOfUnitTime:Float = 10.0           //20秒内到达的平均任务数
    static let TimeSlot:Float = 20.0                    //一个产生任务的间隔  当前是20秒
    static let MaxX = 1400                             //用户区域X轴最大值
    static let MaxY = 1400                             //用户区域Y轴最大值
    static let UserNum = 150                        //系统中用户数量
    
    static let minTaskLength:Float = 100
    static let maxTaskLength:Float = 1000000
    
    static let minTaskCinSize:Float = 500
    static let maxTaskCinSize:Float = 5000000
    
    static let minTaskCoutSize:Float = 500
    static let maxTaskCoutSize:Float = 5000000
    
    static let minResponseTimeLever:Float = 1.0
    static let maxResponseTimeLever:Float = 5.0
    
    static let minLoadBalanceLever:Float = 0.5
    static let maxLoadBalanceLever:Float = 2.0
    
    static let minTotalCostLever:Float = 0.1
    static let maxTotalCostLever:Float = 1.0
    
    static let minSuccessRateLever:Float = 0.8
    static let maxSuccessRateLever:Float = 1.8
    
    static let minNumberOfPes:Int = 1
    static let maxNumberOfPes:Int = 4
    
    static let minMips:Float = 200
    static let maxMips:Float = 200000

    static let minRam:Float = 200
    static let maxRam:Float = 400000
    
    static let minBw:Float = 500
    static let maxBw:Float = 6000000


}
