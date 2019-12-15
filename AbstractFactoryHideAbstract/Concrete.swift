//
//  Concrete.swift
//  AbstractFactoryHideAbstract
//
//  Created by 杨俊艺 on 2019/11/2.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

//各个具体的工厂类
class CompactCarFactory: CarFactory {
    override func createFloorplan() -> Floorplan {
        return StandardFloorplan()
    }
    
    override func createSuspension() -> Suspension {
        return RoadSuspension()
    }
    
    override func createDrivetrain() -> Drivetrain {
        return FrontWheelDrive()
    }
}

class SportsCarFactory: CarFactory {
    override func createFloorplan() -> Floorplan {
        return ShortFloorplan()
    }
    
    override func createSuspension() -> Suspension {
        return RaceSuspension()
    }
    
    override func createDrivetrain() -> Drivetrain {
        return RearWheelDrive()
        //return AllWheelDrive()
    }
}

class SUVCarFactory: CarFactory {
    override func createFloorplan() -> Floorplan {
        return LongFloorplan()
    }
    
    override func createSuspension() -> Suspension {
        return OffRoadSuspension()
    }
    
    override func createDrivetrain() -> Drivetrain {
        return AllWheelDrive()
    }
}
