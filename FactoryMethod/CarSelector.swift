//
//  CarSelector.swift
//  FactoryMethod
//
//  Created by 杨俊艺 on 2019/10/30.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

class CarSelector {
    class func selectCar(passengers: Int) -> String? {
        return createRentalCar(passengers: passengers)?.name
    }
}
