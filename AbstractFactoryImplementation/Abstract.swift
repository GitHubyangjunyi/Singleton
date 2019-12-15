//
//  Abstract.swift
//  AbstractFactoryImplementation
//
//  Created by 杨俊艺 on 2019/11/2.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

//抽象工厂类将被用作具体工厂类的基类
class CarFactory {
    func createFloorplan() -> Floorplan {
        fatalError("Not implemented")
    }
    
    func createSuspension() -> Suspension {
        fatalError("Not implemented")
    }
    
    func createDrivetrain() -> Drivetrain {
        fatalError("Not implemented")
    }
    
    final class func getFactory(car: Cars)-> CarFactory? {
        var factory: CarFactory?
        switch car {
        case .COMPACT:
            factory = CompactCarFactory()
        case .SPORTS:
            factory = SportsCarFactory()
        case .SUV:
            factory = SUVCarFactory()
        }
        return factory
    }
}
