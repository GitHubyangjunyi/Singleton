//
//  main.swift
//  SingletonConcurrent
//
//  Created by 杨俊艺 on 2019/10/14.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

var server = BackupServer.server

let queue = DispatchQueue.init(label: "workQueue", attributes: [.concurrent])
let group = DispatchGroup()

for _ in 0..<100{
    queue.async(group: group, execute: {() in server.backup(item: DataItem(type: DataItem.ItemType.Email, data: "xxx@qq.com"))})
}


group.wait()

print("\(server.getData().count) items were backed up")

//备份个数不一致且偶尔出现访问错误
//改成100基本上都会出现访问错误
