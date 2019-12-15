//
//  PriceCalculator.swift
//  FactoryMethod
//
//  Created by 杨俊艺 on 2019/10/30.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

class PriceCalculator {
    class func calculatePrice(passengers: Int, days: Int) -> Float? {
        let car = createRentalCar(passengers: passengers)
        return car == nil ? nil : car!.pricePerDay * Float(days)
    }
}
