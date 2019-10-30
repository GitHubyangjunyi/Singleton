//
//  main.swift
//  TraditionalSingleton
//
//  Created by 杨俊艺 on 2019/10/14.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

var server = BackupServer.server

server.backup(item: DataItem(type: DataItem.ItemType.Email, data: "joe@qq.com"))
server.backup(item: DataItem(type: DataItem.ItemType.Phone, data: "1234567"))
globalLogger.log(msg: "Backed up 2 items to \(server.name)")


var otherServer = BackupServer.server
otherServer.backup(item: DataItem(type: DataItem.ItemType.Email, data: "xxx@qq.com"))
globalLogger.log(msg: "Backed up 1 items to \(otherServer.name)")

globalLogger.printLog()

print(server === otherServer)

print("\(server.getData()[0].data)  \(server.getData()[1].data)  \(server.getData()[2].data)")
