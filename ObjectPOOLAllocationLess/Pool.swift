//
//  Pool.swift
//  ObjectPOOLAllocationLess
//
//  Created by 杨俊艺 on 2019/10/30.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

class Pool<T: AnyObject>{
    private var data = [T]()
    private let arrayQ = DispatchQueue.init(label: "arrayQ")
    private let semaphore: DispatchSemaphore
    private var createdCount: Int = 0
    private let maxItemCount: Int
    private let itemFactory: () -> T
    private let itemAllocator: ([T]) -> Int
    
    init(itemCount: Int, itemFactory: @escaping () -> T, itemAllocator: @escaping ([T]) -> Int) {
        self.maxItemCount = itemCount
        self.itemFactory = itemFactory
        self.itemAllocator = itemAllocator
        semaphore = DispatchSemaphore(value: itemCount)
    }
    
    func getFromPool() -> T? {
        var result: T?
        
        if semaphore.wait(timeout: DispatchTime.distantFuture) == .success {
            arrayQ.sync(execute: {() in
                if self.data.count == 0 {
                    result = self.itemFactory()
                    self.createdCount += 1
                } else {
                    result = self.data.remove(at: self.itemAllocator(self.data))
                }
            })
        }
        return result
    }
    
    func returnToPool(item: T) {
        arrayQ.async(execute: {() in
            self.data.append(item)
            print("\((item as! Book).stockNumber) has been return!")
            self.semaphore.signal()
        })
    }
    
    func processPoolItems(callback: ([T]) -> Void) {
        arrayQ.sync(execute: {() in
            callback(self.data)
        })
    }
    
}
