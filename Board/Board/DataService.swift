//
//  DataService.swift
//  Board
//
//  Created by Wang Yu on 1/11/16.
//  Copyright © 2016 Wang Yu. All rights reserved.
//

import UIKit

class DataService: NSObject {
    
    static var currentBoard: Board? {
        willSet {
            if let board = currentBoard {
                board.saveToFile()
            }
        }
    }
    
    class func saveBoard(board: Board) {
        board.saveToFile()
    }
    
    class func filenameGenerate(object: AnyObject) -> String {
        var filename = ""
        if let board = object as? Board {
            filename = SeralizationKeys.Board + board._id
        } else {
            fatalError()
        }
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!.stringByAppendingString(filename)
    }
    
    class func getBoard(id _id: String) -> Board? {
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!.stringByAppendingString(SeralizationKeys.Board + _id)
        return NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? Board
    }
    
    class func test() {
        let person = Person(_id: "person", facebookId: "facebookPerson", avatar: "hhh", accessToken: "access", bills: ["billid"], boards: ["boardid"], createdAt: NSDate(), lastLoginAt: NSDate())
        let bill = Bill(_id: "billid", title: "A Bill", time: NSDate(), amounts: ["person" : 103], creator: "person")
        let board = Board(_id: "boardid", name: "A Board", creator: person, createdAt: NSDate())
        board.bills = [bill]
        DataService.currentBoard = board
        DataService.currentBoard!.saveToFile()
        let b = DataService.getBoard(id: "boardid")
        print(b!.bills?.first?.creator.idToPerson()?._id)
    }
    
}
