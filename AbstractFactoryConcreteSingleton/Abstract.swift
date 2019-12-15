//
//  Abstract.swift
//  AbstractFactoryConcreteSingleton
//
//  Created by 杨俊艺 on 2019/11/2.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

//抽象工厂类将被用作具体工厂类的基类
class CarFactory {
    required init() {
        //
    }
    
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
        var factoryType: CarFactory.Type
        switch car {
        case .COMPACT:
            factoryType = CompactCarFactory.self
        case .SPORTS:
            factoryType = SportsCarFactory.self
        case .SUV:
            factoryType = SUVCarFactory.self
        }
        var factory = factoryType.sharedInstance
        if factory == nil {
            factory = factoryType.init()
        }
        return factory
    }
    
    class var sharedInstance: CarFactory? {
        get {
            return nil
        }
    }
}

//添加sharedInstance的计算类属性,如果具体工厂想实现单例模式可以重写这个方法
//并修改了getFactory的实现,如果sharedInstance有值则将该值发送给调用组件
//如果没有重写sharedInstance属性的具体工厂类将继承其默认实现,即创建一个新的工厂实例以响应请求
