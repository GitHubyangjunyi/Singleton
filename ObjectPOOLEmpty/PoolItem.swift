//
//  PoolItem.swift
//  ObjectPOOLEmpty
//
//  Created by 杨俊艺 on 2019/10/28.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

@objc protocol PoolItem {
    var canReuse: Bool {get}
}
