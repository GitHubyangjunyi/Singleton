//
//  main.swift
//  AbstractFactoryConcreteSingleton
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

//var car = Car(carType: Cars.SPORTS, floor: ShortFloorplan(), suspension: RaceSuspension(), drive: RearWheelDrive())
//
//car.printDetails()

//目前问题是选择实现类的逻辑散布在应用的各个角落,并且调用组件对某个具体的实现类存在依赖
//如果汽车型号所对应的零部件产品表发生变化,所有使用了相关零部件的组件都要进行修改,容易出错且不好测试


//let factory = CarFactory.getFactory(car: .SPORTS)
//
//if factory != nil {
//    let car = Car(carType: .SPORTS, floor: factory!.createFloorplan(), suspension: factory!.createSuspension(), drive: factory!.createDrivetrain())
//    car.printDetails()
//}

//这里创建汽车的代码与每个产品类之间不存在依赖关系
//如果汽车型号所对应的零部件产品发生变化也只需要更新对应的具体工厂类而不用对使用这些类的组件进行修改
//比如改动了跑车的传动系统
//class SportsCarFactory: CarFactory {
//    override func createFloorplan() -> Floorplan {
//        return ShortFloorplan()
//    }
//
//    override func createSuspension() -> Suspension {
//        return RaceSuspension()
//    }
//
//    override func createDrivetrain() -> Drivetrain {
//        //return RearWheelDrive()
//        //改成下面的传动系统
//        return AllWheelDrive()
//    }
//}

//没有隐藏抽象工厂类是比较繁琐
//let factory = CarFactory.getFactory(car: .SPORTS)
//
//if factory != nil {
//    let car = Car(carType: .SPORTS, floor: factory!.createFloorplan(), suspension: factory!.createSuspension(), drive: factory!.createDrivetrain())
//    car.printDetails()
//}

//隐藏抽象工厂类后简化代码
let carh = Car(carType: .SUV)
carh.printDetails()

//这个方法对调用组件对意图做了两个假设
//1.调用组件想创建一个Car对象
//2.需要全部三个对象
//如果决定采用这个变体就需要确保调用组件可以访问抽象工厂,可以在需要的时候创建响应的对象

