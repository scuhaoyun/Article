//
//  ExcutionResource.swift
//  M3CSim
//
//  Created by 郝赟 on 16/11/30.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation

/**
 *  调用构造函数会根据各个参数的阈值随机产生响应的值，并生成一个随机对象
 */
struct ExecutionResource {
    var numberOfPes:Int
    var mips:Float
    var ram:Float
    var bw:Float
    init(){
        numberOfPes = RandomMath.randomInt(min: Constants.minNumberOfPes, max: Constants.maxNumberOfPes)
        mips = RandomMath.randomFloat(min: Constants.minMips, max: Constants.maxMips)
        ram = RandomMath.randomFloat(min: Constants.minRam, max: Constants.maxRam)
        bw = RandomMath.randomFloat(min: Constants.minBw, max: Constants.maxBw)
    }

}