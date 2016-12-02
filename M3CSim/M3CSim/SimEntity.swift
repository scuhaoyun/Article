//
//  SimEntity.swift
//  M3CSim
//
//  Created by 郝赟 on 16/12/2.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
class SimEntity: NSObject {
    var id:Int = 0                                               //对象编号
    var algorithmType:AlgorithmType = AlgorithmType.GAPA         //所执行的算法类型
}