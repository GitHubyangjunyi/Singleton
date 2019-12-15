//
//  RentalCar.swift
//  FactoryMethodBaseClass
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
        var car: RentalCar?
        switch passengers {
            case 0...3:
                car = Compact()
            case 4...8:
                car = SUV()
            default:
                car = nil
        }
        return car
    }
}

//各个子类必需调用RentalCar的构造器
class Compact: RentalCar {
    fileprivate init() {
        super.init(name: "VM Golf", passengers: 3, price: 20)
    }
}

class SUV: RentalCar {
    fileprivate init() {
        super.init(name: "Cadillac Escalade ", passengers: 8, price: 75)
    }
}
