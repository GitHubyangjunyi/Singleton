//
//  PriceCalculator.swift
//  FactoryMethodBaseClassDeep
//
//  Created by 杨俊艺 on 2019/11/1.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

class PriceCalculator {
    class func calculatePrice(passengers: Int, days: Int) -> Float? {
        let car = RentalCar.createRentalCar(passengers: passengers)
        return car == nil ? nil : car!.pricePerDay * Float(days)
    }
}
