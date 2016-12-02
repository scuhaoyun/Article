//
//  TaskList.swift
//  M3CSim
//
//  Created by 郝赟 on 16/11/30.
//  Copyright © 2016年 haoyun. All rights reserved.
//

import Foundation
struct TaskQueue {
    /**
     *  模拟任务队列的任务数组
     */
    var tasksArray:NSMutableArray = NSMutableArray()
    /**
     *  任务队列中有序的任务优先级
     */
    var tasksPriorityArray:NSMutableArray?
    /**
     *  任务队列类型，网络、调度还是处理队列
     */
    var taskQueueType:TaskQueueType!
    
    /**
     *  按照任务优先级向队列中插入任务
     *
     *  @param task:Task 需要加入队列的任务
     *
     *  @return 插入成功返回true,否则返回false
     */
    func insertTaskByPriority(task:Task)-> Bool {
        if tasksPriorityArray != nil {
            var insertIndex = 0
            for (index,priority) in tasksPriorityArray!.enumerate() {
                if task.taskLever.getSchedulerPriority() <= (priority as! Float) {
                    insertIndex = index
                    break
                }
            }
            tasksPriorityArray!.insertObject(task.taskLever.getSchedulerPriority(), atIndex: insertIndex)
            tasksArray.insertObject(task, atIndex: insertIndex)
            return true
        }
        return false
    }
    
    /**
     *  任务队列根据不同的队列类型使用不同方式接收任务
     *
     *  @param task:Task 入队任务
     *
     *  @return 成功返回true，否则返回false
     */
    func receiveTask(task:Task)->Bool{
        if taskQueueType == TaskQueueType.Scheduler {
            return insertTaskByPriority(task)
        }
        else {
            inQueue(task)
            return true
        }
    }
    
    /**
     *  输出任务队列中的所有任务
     *
     *  @return 任务数组
     */
    func getAllTasks() -> [Task] {
        return NSArray(array:tasksArray) as! [Task]
    }
    
    /**
     *  任务入队
     *
     *  @param task:Task 入队任务对象
     *
     *  @return void
     */
    func inQueue(task:Task){
        tasksArray.insertObject(task, atIndex: 0)
    }

    /**
     *  任务出队
     *
     *  @return 队列中有任务时返回队首任务，否则返回nil
     */
    func outQueue() -> Task? {
        let count = tasksArray.count
        if count > 0{
            let task:Task = tasksArray[count - 1] as! Task
            tasksArray.removeObjectAtIndex(count-1)
            return task
        }
        else{
            return nil
        }
    }
    
}