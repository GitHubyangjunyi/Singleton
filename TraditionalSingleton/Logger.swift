//
//  Logger.swift
//  TraditionalSingleton
//
//  Created by 杨俊艺 on 2019/10/14.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

let globalLogger = Logger()

final class Logger {
    private var data = [String]();
    
    fileprivate init(){
        
    }
    
    func log(msg:String) {
        data.append(msg)
    }
    
    func printLog() {
        for msg in data {
            print("Log: \(msg)");
        }
    }
}
