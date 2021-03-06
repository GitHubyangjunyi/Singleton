//
//  CarsParts.swift
//  AbstractFactoryHideAbstract
//
//  Created by 杨俊艺 on 2019/11/2.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

//表示汽车型号的Cars枚举
enum Cars: String {
    case COMPACT = "VM Golf"
    case SPORTS = "Porsche Boxter"
    case SUV = "Cadillac Escalade"
}

struct Car {
    var carType: Cars
    var floor: Floorplan
    var suspension: Suspension
    var drive: Drivetrain

    init(carType: Cars) {
        let concreteFactory = CarFactory.getFactory(car: carType)
        self.floor = concreteFactory!.createFloorplan()
        self.suspension = concreteFactory!.createSuspension()
        self.drive = concreteFactory!.createDrivetrain()
        self.carType = carType
    }
    
    func printDetails() {
        print("Car type: \(carType.rawValue)")
        print("Seats: \(floor.seats)")
        print("Engine : \(floor.enginePosition.rawValue)")
        print("Suspension: \(suspension.suspensionType.rawValue)")
        print("Drive: \(drive.DriveType.rawValue)")
    }
}
