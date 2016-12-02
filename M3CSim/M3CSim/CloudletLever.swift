//
//  CloudletLever.swift
//  M3CSim
//
//  Created by 郝赟 on 16/12/2.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
//接入点级别,值表示该AP附近的用户发送任务的概率
enum CloudletLever: Float {
    case Company = 0.8   //公司附近，员工专用
    case Cafe = 0.7      //咖啡馆
    case Park = 0.6     //公园
    case Street = 0.5   //街道
    case Car = 0.4      //汽车
    func toString() -> String {
        switch self {
            case .Company: return "Company"
            case .Cafe:    return "Cafe"
            case .Park:    return "Park"
            case .Street:  return "Street"
            case .Car:     return "Car"
            //default:       return "None"
        }
    }
}
