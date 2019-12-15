//
//  Pool.swift
//  ObjectPOOLLazy
//
//  Created by 杨俊艺 on 2019/10/28.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

class Pool<T>{
    private var data = [T]()
    private var itemCount = 0
    private let maxItemCount: Int
    private let itemFactory: () -> T
    private let arrayQ = DispatchQueue.init(label: "arrayQ")
    private let semaphore: DispatchSemaphore
    
    init(maxItemCount: Int, factory: @escaping () -> T) {
        itemFactory = factory
        self.maxItemCount = maxItemCount
        semaphore = DispatchSemaphore(value: maxItemCount)
    }
    
    func getFromPool() -> T? {
        var result: T?
        semaphore.wait()
        arrayQ.sync(execute: {() in
            if self.data.count == 0 && self.itemCount < self.maxItemCount {
                result = self.itemFactory()
                itemCount += 1
            } else {
                result = self.data.remove(at: 0)
            }
        })
        return result
    }
    
    func returnToPool(item: T) {
        arrayQ.async(execute: {() in
            self.data.append(item)
            print("\((item as! Book).stockNumber) has been return!")    //为了测试还的是哪本书,这里不该引入Book类型信息,导致耦合
            self.semaphore.signal()
        })
    }
    
    func processPoolItems(callback: ([T]) -> Void) {
        arrayQ.sync(execute: {() in
            callback(self.data)
        })
    }
    
}
