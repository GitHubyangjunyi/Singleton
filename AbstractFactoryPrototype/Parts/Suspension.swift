//
//  Suspension.swift
//  AbstractFactoryPrototype
//
//  Created by 杨俊艺 on 2019/11/2.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

//表示汽车减震悬架类型的SuspensionOption枚举
//enum SuspensionOption: String {
//    case STANDARD = "Standard"
//    case SPORTS = "Firm"
//    case SOFT = "Soft"
//}
//将Swift枚举移除

//表示汽车减震悬架的Suspension协议
@objc protocol Suspension {
    var suspensionType: SuspensionOption { get }
    static func getInstance() -> Suspension
}

//三种不同的汽车减震悬架
class RoadSuspension: Suspension {
    var suspensionType: SuspensionOption = SuspensionOption.STANDARD
    private init() {}
    class func getInstance()  -> Suspension {
        return RoadSuspension()
    }
}

class OffRoadSuspension: Suspension {
    var suspensionType: SuspensionOption = SuspensionOption.SOFT
    private init() {}
    class func getInstance()  -> Suspension {
        return OffRoadSuspension()
    }
}

class RaceSuspension: NSObject, NSCopying, Suspension {
    var suspensionType: SuspensionOption = SuspensionOption.SPORTS
    private override init() {}
    class func getInstance()  -> Suspension {
        return copy() as! Suspension
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return RaceSuspension()
    }
}
