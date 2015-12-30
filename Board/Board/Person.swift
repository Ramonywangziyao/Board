//
//  Person.swift
//  Board
//
//  Created by Wang Yu on 12/29/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

/*
    var personSchema = mongoose.Schema({
    _id: {type: String, default: uuid.v4},
    facebookId: String,
    accessToken: String,
    bills: [{type: String, ref: 'Bill'}],
    boards: [{type: String, ref: 'Board'}],
    createdAt: {type: Date, default: Date.now},
    lastLoginAt: {type: Date, default: Date.now}
    });
*/

class Person: NSObject {
    
    var _id: String!
    var facebookId: String!
    var accessToken: String!
    var bills: [Bill]!
    var boards: [Board]!
    var createdAt: NSDate!
    var lastLoginAt: NSDate!

    override init() {
        super.init()
    }
    
}
