//
//  NetworkTopology.swift
//  M3CSim
//
//  Created by 郝赟 on 16/11/30.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
/**
 *  M3C系统网络拓扑图
 */
class NetworkTopologyGraph:SimEntity {
    //var bwMatric:[[Float]] = []     //连接带宽矩阵
    var matrix:[[Float]]              //网络拓扑矩阵，1代表两个节点连接，0代表两个节点未连接
    var nodesNumber:Int              //节点(Cloudlet)的数量
    var edgesNumber:Int              //边(Cloudlet连接)的数量
    override init(){
        self.matrix = []
        self.nodesNumber = 0
        self.edgesNumber = 0
    }
    init(matrix:[[Float]],node:Int,edge:Int)
    {
        self.matrix = matrix
        self.nodesNumber = node
        self.edgesNumber = edge
    }
    /**
     *  该构造器直接接受一个cloudletId连接状况的二维数组，从而生成网络拓扑图
     *  注:该二维数组中，cloudletId是从1开始编号，而其它地方是从0开始编号
     */
    init(cloudletNetworkConnectArray:[[Int]])
    {
        let nodeNum = cloudletNetworkConnectArray.count
        var edgeNum = 0
        var matrix:[[Float]] = [[Float]](count: nodeNum, repeatedValue: [Float](count: nodeNum, repeatedValue: 0))
        for (fromCloudletId,cloudletList) in cloudletNetworkConnectArray.enumerate() {
            for id in cloudletList {
                let toCloudletId = id - 1
                matrix[fromCloudletId][toCloudletId] = 1
                edgeNum += 1
            }
        }
        self.matrix = matrix
        self.nodesNumber = nodeNum
        self.edgesNumber = edgeNum
    }
}
