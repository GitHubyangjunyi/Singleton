//
//  main.swift
//  Singleton
//
//  Created by 杨俊艺 on 2019/10/13.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

var server = BackupServer(name: "Server#1")

server.backup(item: DataItem(type: DataItem.ItemType.Email, data: "joe@qq.com"))
server.backup(item: DataItem(type: DataItem.ItemType.Phone, data: "1234567"))
globalLogger.log(msg: "Backed up 2 items to \(server.name)")


var otherServer = BackupServer(name: "Server#2")
otherServer.backup(item: DataItem(type: DataItem.ItemType.Email, data: "xxx@qq.com"))
globalLogger.log(msg: "Backed up 1 items to \(otherServer.name)")

globalLogger.printLog()
