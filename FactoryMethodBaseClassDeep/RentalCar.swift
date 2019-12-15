//
//  RentalCar.swift
//  FactoryMethodBaseClassDeep
//
//  Created by 杨俊艺 on 2019/11/1.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

//基类
class RentalCar {
    private var nameBV: String
    private var passengersBV: Int
    private var pricePerDayBV: Float
    
    //私有化构造器
    fileprivate init(name: String, passengers: Int, price: Float) {
        self.nameBV = name
        self.passengersBV = passengers
        self.pricePerDayBV = price
    }
    
    //final修饰的计算属性
    final var name: String {
        get { return nameBV }
    }
    
    final var passengers: Int {
        get { return passengersBV }
    }
    
    final var pricePerDay: Float {
        get { return pricePerDayBV }
    }
    
    class func createRentalCar(passengers: Int) -> RentalCar? {
        var carImpl: RentalCar.Type?    //Type说明这个变量表示的是元类型而非对象
        switch passengers {
            case 0...3:
                carImpl = Compact.self
            case 4...8:
                carImpl = SUV.self
            default:
                carImpl = nil
        }
        return carImpl?.createRentalCar(passengers: passengers)
    }
}

//各个子类必需调用RentalCar的构造器
class Compact: RentalCar {
    fileprivate override init(name: String, passengers: Int, price: Float) {
        super.init(name: name, passengers: passengers, price: price)
    }
    
    fileprivate convenience init() {
        self.init(name: "VM Golf", passengers: 3, price: 20)
    }
    
    override class func createRentalCar(passengers: Int) -> RentalCar? {
        if passengers > 2 {
            return Compact()
        } else {
            return SmallCompact()
        }
    }
}

class SmallCompact: Compact {
    fileprivate init() {
        super.init(name: "Ford Fiesta", passengers: 2, price: 15)
    }
}

class SUV: RentalCar {
    fileprivate init() {
        super.init(name: "Cadillac Escalade ", passengers: 8, price: 75)
    }
    
    override class func createRentalCar(passengers: Int) -> RentalCar? {
        return SUV()
    }
}
