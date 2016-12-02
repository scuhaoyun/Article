//
//  RandomMath.swift
//  M3CSim
//
//  Created by 郝赟 on 16/11/30.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
class RandomMath{
    /**
     *  该函数根据输入各个事件各自出现的概率或权重(轮盘赌离散概率)，随机产生一个事件，并返回事件对应下标
     *
     *  @param occurProbability: 离散概率或权重数组
     *
     *  @return 对应事件索引下标
     */
    class func indexForRoulette(occurProbability occurProbability:[Float])->Int{
        var cuPro = occurProbability
        for i in 1 ..< occurProbability.count {
            cuPro[i] = cuPro[i] + cuPro[i-1]
        }
        return indexForRoulette(cumulativeProbability: cuPro)
    }
    /**
     *  该函数根据输入各个事件的累积概率，随机产生一个事件，并返回事件对应下标
     *
     *  @param cumulativeProbability: 累积概率或累积权重
     *
     *  @return 对应事件索引下标
     */
    class func indexForRoulette(cumulativeProbability cumulativeProbability:[Float])->Int{
        let rmFloat = randomFloat(min: 0.0, max: cumulativeProbability.last!)
        for (index,item) in cumulativeProbability.enumerate() {
            if rmFloat <= item {
                 return index
            }
        }
        return cumulativeProbability.count - 1
    }
    
    /**
    *  产生一个区间的随机整数
    *
    *  @param Int 区间下边界
    *  @param Int 区间上边界
    *
    *  @return 随机整数
    */
    class func randomInt(min min: Int, max: Int) -> Int {
        return Int(arc4random()) % (max - min + 1) + min
    }
    /**
     *  产生一个区间的随机小数
     *
     *  @param Float 区间下边界
     *  @param Float 区间上边界
     *
     *  @return 随机小数
     */
    class func randomFloat(min min: Float, max: Float) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF) * (max - min + 1) + min
    }
    /**
    *  判断一个概率事件是否成立
    *
    *  @param percent:Float 一个独立事件的概率
    *
    *  @return 是否发生该事件
    */
    class func inPercentEvent(percent:Float) -> Bool{
    
        let rmFloat = randomFloat(min: 0.0, max: 1.0)
        
        return rmFloat <= percent
        
    }
    //
    /**
    *  产生服从泊松分布的随机数
    *
    *  @param lamda:Float lamda
    *
    *  @return 随机数
    */
    class func possionNum (lamda:Float) ->Int {
        //FIXME:得到泊松分布的概率
        func getPossionProbaility(k:Int,lamda:Float) ->Float{
            var sum:Float = 1.0
            for i in 0 ... k {
                //i =0时系数为1
                if i != 0 {
                    sum *= (lamda / Float(i))
                }
            }
            return sum * exp(-lamda)
        }
        
        var x = 0
        let random = randomFloat(min: 0.0, max: 1.0)
        var tmp = getPossionProbaility(x, lamda: lamda)
        while tmp < random {
            x += 1
            tmp += getPossionProbaility(x, lamda: lamda)
        }
        return x
    }


}