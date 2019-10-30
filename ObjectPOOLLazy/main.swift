//
//  main.swift
//  ObjectPOOLLazy
//
//  Created by 杨俊艺 on 2019/10/28.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

var queue = DispatchQueue(label: "workQ", attributes: [.concurrent])
var group = DispatchGroup()

print("Starting...")

for i in 1...20{
    queue.async(group: group, qos: .default, flags: [], execute: {() in
        let book = Library.checkoutBook(reader: "reader#\(i)")
        if book != nil {
            print("\(String(describing: book?.reader)) gets \(String(describing: book?.stockNumber))")
            Thread.sleep(forTimeInterval: Double(arc4random() % 2))
            Library.returnBook(book: book!)
        }
    })
}

group.wait()

//print在并发环境中并不安全
print("All blocks complete")

Library.printReport()
