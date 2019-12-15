//
//  main.swift
//  AbstractFactory
//
//  Created by 杨俊艺 on 2019/11/2.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

//汽车型号所对应的零部件产品
//      Car                 Floorplan               Suspension              Drivetrain
//      COMPACT             StandardFloorplan       RoadSuspension          FrontWheelDrive
//      SPORTS              ShortFloorplan          RaceSuspension          RearWheelDrive
//      SUV                 LongFloorplan           OffSuspension           AllWheelDrive

var car = Car(carType: Cars.SPORTS, floor: ShortFloorplan(), suspension: RaceSuspension(), drive: RearWheelDrive())

car.printDetails()

//目前问题是选择实现类的逻辑散布在应用的各个角落,并且调用组件对某个具体的实现类存在依赖
//如果汽车型号所对应的零部件产品表发生变化,所有使用了相关零部件的组件都要进行修改,容易出错且不好测试
