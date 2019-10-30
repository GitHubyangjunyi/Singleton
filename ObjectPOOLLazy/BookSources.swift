//
//  BookSources.swift
//  ObjectPOOLLazy
//
//  Created by 杨俊艺 on 2019/10/28.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

class BookSeller {
    class func buyBook(author: String, title: String, stockNumber: Int) -> Book {
        return Book(author: author, title: title, stock: stockNumber)
    }
}
