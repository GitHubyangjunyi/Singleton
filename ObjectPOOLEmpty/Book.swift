//
//  Book.swift
//  ObjectPOOLEmpty
//
//  Created by 杨俊艺 on 2019/10/28.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

@objc class Book: NSObject, PoolItem{
    let author: String
    let title: String
    let stockNumber: Int
    var reader: String?
    var checkoutCount = 0
    
    init(author: String, title: String, stock: Int) {
        self.author = author
        self.title = title
        self.stockNumber = stock
    }
    
    var canReuse: Bool {
        get {
            let reusable = checkoutCount < 5
            if !reusable {
                print("Eject: Book#\(self.stockNumber)")
            }
            return reusable
        }
    }
    
}
