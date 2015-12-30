//
//  Board.swift
//  Board
//
//  Created by Wang Yu on 12/29/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

/* 
    var boardSchema = mongoose.Schema({
    _id: {type: String, default: uuid.v4},
    name: String,
    isActive: {type: Boolean, default: true},
    creator: {type: String, ref: 'Person'},
    members: [{type: String, ref: 'Person'}],
    bills: [{type: String, ref: 'Bill'}],
    status: {type: String, default: 'Open'},  // indicate if board is being cleared
    createdAt: {type: Date, default: Date.now}
});
*/

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
