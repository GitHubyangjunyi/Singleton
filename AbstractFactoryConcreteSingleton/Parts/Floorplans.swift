//
//  Floorplans.swift
//  AbstractFactoryConcreteSingleton
//
//  Created by 杨俊艺 on 2019/11/2.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

//表示汽车引擎位置的EngineOption枚举
enum EngineOption: String {
    case FRONT = "Front"
    case MID = "Mid"
}

//表示汽车基本属性的Floorplan协议
protocol Floorplan {
    var seats: Int { get }          //座位数
    var enginePosition: EngineOption { get }      //汽车引擎位置
}

class ShortFloorplan: Floorplan {
    var seats: Int = 2
    var enginePosition = EngineOption.MID
}

class StandardFloorplan: Floorplan {
    var seats: Int = 4
    var enginePosition = EngineOption.FRONT
}

class LongFloorplan: Floorplan {
    var seats: Int = 8
    var enginePosition = EngineOption.FRONT
}
