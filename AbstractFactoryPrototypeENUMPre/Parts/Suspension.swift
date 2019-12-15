//
//  Suspension.swift
//  AbstractFactoryPrototypeENUMPre
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
}

//三种不同的汽车减震悬架
class RoadSuspension: Suspension {
    var suspensionType: SuspensionOption = SuspensionOption.STANDARD
}

class OffRoadSuspension: Suspension {
    var suspensionType: SuspensionOption = SuspensionOption.SOFT
}

class RaceSuspension: NSObject, NSCopying, Suspension {
    var suspensionType: SuspensionOption = SuspensionOption.SPORTS
    
    func copy(with zone: NSZone? = nil) -> Any {
           return RaceSuspension()
       }
       
}
