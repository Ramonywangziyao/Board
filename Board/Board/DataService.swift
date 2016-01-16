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
    
}
