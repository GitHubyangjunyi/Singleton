//
//  Pool.swift
//  ObjectPOOL
//
//  Created by 杨俊艺 on 2019/10/28.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

class Pool<T>{
    private var data = [T]()
    private let arrayQ = DispatchQueue.init(label: "arrayQ")
    private let semaphore: DispatchSemaphore
    
    init(items: [T]) {
        data.reserveCapacity(data.count)
        for item in items{
            data.append(item)
        }
        semaphore = DispatchSemaphore(value: items.count)
    }
    
    func getFromPool() -> T? {
        var result: T?
        semaphore.wait()
        arrayQ.sync(execute: {() in
            result = self.data.remove(at: 0)
        })
        return result
    }
    
    func returnToPool(item: T) {
        arrayQ.async(execute: {() in
            self.data.append(item)
            print("\((item as! Book).stockNumber) has been return!")
            self.semaphore.signal()
        })
    }
}
