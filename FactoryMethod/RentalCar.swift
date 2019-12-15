//
//  RentalCar.swift
//  FactoryMethod
//
//  Created by 杨俊艺 on 2019/10/30.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

protocol RentalCar {
    var name: String { get set}
    var passengers: Int { get }
    var pricePerDay: Float { get }
}

class Compact: RentalCar {
    var name = "VW Golf"
    var passengers = 3
    var pricePerDay: Float = 20
}

class Sports: RentalCar {
    var name = "Porsche Boxter"
    var passengers = 1
    var pricePerDay: Float = 100
}

class SUV: RentalCar {
    var name = "Cadillac Escalade"
    var passengers = 8
    var pricePerDay: Float = 75
}

class Minivan: RentalCar {
    var name = "Chevrolet Express"
    var passengers = 14
    var pricePerDay: Float = 40
}

//全局工厂方法
func createRentalCar(passengers: Int) -> RentalCar? {
    var car: RentalCar?
    switch passengers {
        case 0...1:
            car = Sports()
        case 2...3:
            car = Compact()
        case 4...8:
            car = SUV()
        case 9...14:
            car = Minivan()
        default:
            car = nil
    }
    return car
}
