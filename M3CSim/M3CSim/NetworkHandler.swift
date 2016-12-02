//
//  NetworkHandler.swift
//  M3CSim
//
//  Created by 郝赟 on 16/12/2.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
class NetworkHandler: NSObject {
    var mGraph:NetworkTopologyGraph    //网络拓扑图
    var dist:[Float]                   //每次计算最短路径时，用于存储最短距离
    var path:[Int]                     //每次计算最短路径时，用与存储最短线路结点信息
    init(graph:NetworkTopologyGraph){
        mGraph = graph
        dist = [Float](count: mGraph.nodesNumber, repeatedValue: 0)
        path = [Int](count: mGraph.nodesNumber, repeatedValue: 0)
    }
    /**
     *  执行一次Dijkstra算法过程，找出fromNodeId到其他所有Node的最短路径信息
     *
     *  @param fromNodeId:Int 出发结点编号，从0开始编号
     *
     *  @return void
     */
    private func DijkstraPath(fromNodeId:Int){
        var visited:[Bool] = [Bool](count: mGraph.nodesNumber, repeatedValue: false)
        for i in 0 ... mGraph.nodesNumber - 1 {
            if (mGraph.matrix[fromNodeId][i] > 0 && i != fromNodeId) {
                dist[i] = mGraph.matrix[fromNodeId][i]
                path[i] = fromNodeId
            }
            else {
                dist[i] = 10000.0
                path[i] = -1
                
            }
            visited[i] = false
            path[fromNodeId] = fromNodeId
            dist[fromNodeId] = 0
        }
        visited[fromNodeId] = true
        for _ in 1 ... mGraph.nodesNumber - 1 {
            var min:Float = 10000.0
            var u:Int = 0
            for j in 0 ... mGraph.nodesNumber - 1 {
                if visited[j] == false && dist[j] < min {
                    min = dist[j]
                    u = j
                }
            }
            visited[u] = true
            for k in 0 ... mGraph.nodesNumber - 1 {
                if visited[k] == false  && mGraph.matrix[u][k] > 0 && min + mGraph.matrix[u][k] < dist[k] {
                    dist[k] = min + mGraph.matrix[u][k]
                    path[k] = u
                }
            }
        }
    }
    /**
     *  得到两个节点之间最短路径
     *
     *  @param fromNodeId:Int 出发结点编号，从0开始编号
     *  @param toNodeId:Int   目的结点编号，从0开始编号
     *
     *  @return 返回最短路径 依次的结点编号 和 最短总距离
     */
    func getMinPath(fromNodeId:Int,toNodeId:Int) -> ([Int],Float) {
        DijkstraPath(fromNodeId)
        let s:NSMutableArray = NSMutableArray()
        var vEndId:Int = toNodeId
        s.addObject(fromNodeId)
        while vEndId != fromNodeId {
            s.addObject(vEndId)
            vEndId = path[vEndId]
        }
        s.addObject(vEndId)
        
        //        println("从AP:\(fromNodeId)  到AP:\(toNodeId)    最短路径:\((NSArray(array:s) as! [Int]).reverse())")
        return ((NSArray(array:s) as! [Int]).reverse(),self.dist[toNodeId])
        
    }
}
