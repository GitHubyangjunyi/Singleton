//
//  Pool.swift
//  ObjectPOOLElastic
//
//  Created by 杨俊艺 on 2019/10/29.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

class Pool<T: AnyObject>{
    private var data = [T]()
    private let arrayQ = DispatchQueue.init(label: "arrayQ")
    private let semaphore: DispatchSemaphore
    private var createdCount: Int = 0
    private let normalCount: Int
    private let peakCount: Int
    private let returnCount: Int
    private let waitTime: Int
    private let itemFactory: () -> T
    private let peakFactory: () -> T
    private let peakReaper: (T) -> Void
    
    init(itemCount: Int, peakCount: Int, returnCount: Int, waitTime: Int = 2, itemFactory: @escaping () -> T, peakFactory: @escaping () -> T, peakReaper: @escaping (T) -> Void) {
        self.normalCount = itemCount
        self.peakCount = peakCount
        self.waitTime = waitTime
        self.returnCount = returnCount
        self.itemFactory = itemFactory
        self.peakFactory = peakFactory
        self.peakReaper = peakReaper
        semaphore = DispatchSemaphore(value: itemCount)
    }
    
    func getFromPool() -> T? {
        var result: T?
        let expiryTime = DispatchTime.now() + .seconds(waitTime)
        
        if semaphore.wait(timeout: expiryTime) == .success {
            arrayQ.sync(execute: {() in
                if self.data.count == 0 {
                    result = self.itemFactory()
                    self.createdCount += 1
                } else {
                    result = self.data.remove(at: 0)
                }
            })
        } else {
            arrayQ.sync(execute: {() in
                result = self.peakFactory()
                self.createdCount += 1
            })
        }
        return result
    }
    
    func returnToPool(item: T) {
        arrayQ.async(execute: {() in
            if self.data.count > self.returnCount && self.createdCount > self.normalCount {
                self.peakReaper(item)
                self.createdCount -= 1
            } else {
                self.data.append(item)
                print("\((item as! Book).stockNumber) has been return!")    //为了测试还的是哪本书,这里不该引入Book类型信息,导致耦合
                self.semaphore.signal()
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
