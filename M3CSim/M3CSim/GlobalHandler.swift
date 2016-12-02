//
//  GlobalHandler.swift
//  M3CSim
//
//  Created by 郝赟 on 16/12/1.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
class GlobalHandler: NSObject {
    /**
     *  根据cloudletId和cloudletType查找对应的Cloudlet
     *
     *  @param cloudletId:Int            Cloudlet编号
     *  @param cloudletType:CloudletType Cloudlet应用算法类型
     *
     *  @return 唯一对应的Cloudlet
     */
    class func getCloudlet(cloudletId cloudletId:Int,algorithmType:AlgorithmType)-> Cloudlet{
        return Cloudlet()
    }
    class func getCloudletLever(cloudletId cloudletId:Int)->CloudletLever{
        var cloudletLever:CloudletLever
        switch cloudletId + 1 {
            case 2,3,4,5:                                  cloudletLever = .Company
            case 6,7,9,10,29,36:                           cloudletLever = .Cafe
            case 12,13,14,16,31,32,33,34:                  cloudletLever = .Park
            case 1,8,10,17,18,19,20,22,23,25,26,28,30:     cloudletLever = .Street
            case 11,15,21,24,27,35:                        cloudletLever = .Car
            default:                                       cloudletLever = .Park
        }
        return cloudletLever
    }
    class func getCumulativeProbabilityOfCloudlets(cloudletNum:Int)->[Float]{
        var probility:[Float] = [Float](count: cloudletNum, repeatedValue: 0)
        probility[0]  = getCloudletLever(cloudletId: 0).rawValue
        for i in 1 ..< cloudletNum {
            probility[i] = probility[i-1] + getCloudletLever(cloudletId: i).rawValue
        }
        return probility
    }
}