//
//  Board.swift
//  Board
//
//  Created by Wang Yu on 12/29/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

class Board: NSObject {
    
    var _id: String!
    var name: String!
    var isActive: Bool!
    var creator: Person!
    var members: [Person]!
    var bills: [Bill]!
    var status: String!
    var createdAt: NSDate!
    
    override init() {
        super.init()
    }

}
