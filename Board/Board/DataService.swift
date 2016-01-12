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
    
}
