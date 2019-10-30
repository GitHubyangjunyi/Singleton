//
//  Logger.swift
//  SingletonConcurrentFix
//
//  Created by 杨俊艺 on 2019/10/27.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

let globalLogger = Logger()

final class Logger {
    private var data = [String]();
    private let arrayQ = DispatchQueue(label: "arrayQ")
    
    fileprivate init(){
        
    }
    
    func log(msg:String) {
        arrayQ.async(execute: {self.data.append(msg)})
    }
    
    func printLog() {
        for msg in data {
            print("Log: \(msg)");
        }
    }
}
