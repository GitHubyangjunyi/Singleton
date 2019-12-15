//
//  Drivetrains.swift
//  AbstractFactoryConcreteSingleton
//
//  Created by 杨俊艺 on 2019/11/2.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

//表示汽车传动系统类型的DriveOption枚举
enum DriveOption: String {
    case FRONT = "Front"
    case REAR = "Rear"
    case ALL = "4WD"
}

//表示汽车传动系统的Drivetrain协议
protocol Drivetrain {
    var DriveType: DriveOption { get }
}

//三种不同的汽车传动系统
class FrontWheelDrive: Drivetrain {
    var DriveType = DriveOption.FRONT
}

class RearWheelDrive: Drivetrain {
    var DriveType = DriveOption.REAR
}

class AllWheelDrive: Drivetrain {
    var DriveType = DriveOption.ALL
}
