//
//  Library.swift
//  ObjectPOOLAllocation
//
//  Created by 杨俊艺 on 2019/10/28.
//  Copyright © 2019 杨俊艺. All rights reserved.
//

import Foundation

final class Library {
    private let pool: Pool<Book>
    
    private init(stockLevel: Int){
        var stockId = 0
        pool = Pool<Book>(itemCount: stockLevel, itemFactory: {() in
            stockId += 1
            return BookSeller.buyBook(author: "Dckens, Charles", title: "Hard Times", stockNumber: stockId)
        }, itemAllocator: {(books) in return 0})    //闭包返回数组第一个对象,也就是先进先出策略
    }
    
    private class var singleton: Library{
        struct SingletonWrapper{
            static let singleton = Library(stockLevel: 5)
        }
        return SingletonWrapper.singleton
    }
    
    class func checkoutBook(reader: String) -> Book? {
        let book = singleton.pool.getFromPool()
        book?.reader = reader
        book?.checkoutCount += 1
        return book
    }
    
    class func returnBook(book: Book) {
        book.reader = nil
        singleton.pool.returnToPool(item: book)
    }
    
    class func printReport() {
        singleton.pool.processPoolItems(callback: {(books) in
            for book in books {
                print("...Book#\(book.stockNumber)...")
                print("Check out \(book.checkoutCount) times")
                if book.reader != nil {
                    print("Checked out to \(book.reader!)")
                } else {
                  print("In stock")
                }
            }
            print("There are \(books.count) books in the pool")
        })
    }
    
}
