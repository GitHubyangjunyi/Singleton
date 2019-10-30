//
//  Pool.swift
//  ObjectPOOLExhausted
//
//  Created by 杨俊艺 on 2019/10/29.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

class Pool<T: AnyObject>{
    private var data = [T]()
    private var itemCount = 0
    private let maxItemCount: Int
    private let itemFactory: () -> T
    private let arrayQ = DispatchQueue.init(label: "arrayQ")
    private let semaphore: DispatchSemaphore
    private var ejectedItems = 0
    private var poolExhausted = false
    
    init(maxItemCount: Int, factory: @escaping () -> T) {
        self.itemFactory = factory
        self.maxItemCount = maxItemCount
        semaphore = DispatchSemaphore(value: maxItemCount)
    }
    
    func getFromPool(maxWaitSeconds: Int = -1) -> T? {
        var result: T?
        let waitTime = (maxWaitSeconds == -1) ? DispatchTime.distantFuture : DispatchTime.now() + .seconds(maxWaitSeconds)
        
        if !poolExhausted {
            if semaphore.wait(timeout: waitTime) == .success {
                if !poolExhausted {
                    arrayQ.sync(execute: {() in
                        if self.data.count == 0 && self.itemCount < self.maxItemCount {
                            result = self.itemFactory()
                            self.itemCount += 1
                        } else {
                            result = self.data.remove(at: 0)
                        }
                    })
                }
            }
        }
        return result
    }
    
    func returnToPool(item: T) {
        arrayQ.async(execute: {() in
            if let pitem = item as AnyObject as? PoolItem{
                if pitem.canReuse {
                    self.data.append(item)
                    print("\((item as! Book).stockNumber) has been return!")
                    self.semaphore.signal()
                } else {
                    self.ejectedItems += 1
                    if self.ejectedItems == self.maxItemCount {
                        self.poolExhausted = true
                        self.flushQueue()
                    }
                }
            } else {
                self.data.append(item)
            }
        })
    }
    
    private func flushQueue() {
        let dQueue = DispatchQueue(label: "drainer", attributes: .concurrent)
        var backlogCleared = false
        
        dQueue.async(execute: {() in
            self.semaphore.wait()   //GCD信号量可以让线程以先进先出的顺序执行,在前面等待的请求通过之前,GCD信号量不会让这个Block执行,但是下面的Block将会一直操作信号量,这样就可以清退之前那些在对象池枯竭之前尚未完成而一直等待的请求
            backlogCleared = true
        })
        
        dQueue.async(execute: {() in
            while !backlogCleared {
                self.semaphore.signal()
            }
        })
    }
    
    func processPoolItems(callback: ([T]) -> Void) {
        arrayQ.sync(execute: {() in
            callback(self.data)
        })
    }
    
}
