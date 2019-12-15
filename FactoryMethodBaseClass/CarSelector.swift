//
//  CarSelector.swift
//  FactoryMethodBaseClass
//
//  Created by 杨俊艺 on 2019/11/1.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

class CarSelector {
    class func selectCar(passengers: Int) -> String? {
        return RentalCar.createRentalCar(passengers: passengers)?.name
    }
}
