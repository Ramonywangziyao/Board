//
//  DataService.swift
//  Board
//
//  Created by Wang Yu on 1/11/16.
//  Copyright © 2016 Wang Yu. All rights reserved.
//

import UIKit

class DataService: NSObject {
    
    private let billPath = {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!.stringByAppendingString("bill")
    }
    
    private let PersonPath = {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!.stringByAppendingString("person")
    }
    
    private let BoardPath = {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!.stringByAppendingString("board")
    }
    
    func test() {
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!.stringByAppendingString("test")
        let person = Person(_id: "hahaha", facebookId: "ewr", accessToken: "1235343523", bills: nil, boards: nil, createdAt: NSDate(), lastLoginAt: NSDate())
        let bill = Bill(_id: "lllId", title: "Title", time: NSDate(), photoId: "haha", amounts: [person._id: 1234], isPaid: true, creator: person, isDeleted: false)
        let board = Board(_id: "BoardId", name: "A Board", creator: person, createdAt: NSDate())
        board.bills = [bill]
        NSKeyedArchiver.archiveRootObject(board, toFile: path)
        let lll = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as! Board
        print(lll.creator._id)
    }
    
}
