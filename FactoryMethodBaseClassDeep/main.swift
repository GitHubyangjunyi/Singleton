//
//  main.swift
//  FactoryMethodBaseClassDeep
//
//  Created by 杨俊艺 on 2019/11/1.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

let passengers = [1, 3, 5, 12]

for p in passengers {
    print("\(p) passengers: \(String(describing: CarSelector.selectCar(passengers: p)))")
}


