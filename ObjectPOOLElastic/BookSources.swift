//
//  BookSources.swift
//  ObjectPOOLElastic
//
//  Created by 杨俊艺 on 2019/10/29.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

class BookSeller {
    class func buyBook(author: String, title: String, stockNumber: Int) -> Book {
        return Book(author: author, title: title, stock: stockNumber)
    }
}

class LibraryNetWork {
    class func borrowBook(author: String, title: String, stockNumber: Int) -> Book {
        print("LibraryNetWork.borrowBook for \(stockNumber)")
        return Book(author: author, title: title, stock: stockNumber)
    }
    
    class func returnBook(book: Book) {
        //TODO
        print("LibraryNetWork.returnBook for \(book.stockNumber)")
    }
}
