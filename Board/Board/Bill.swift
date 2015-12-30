//
//  Bill.swift
//  Board
//
//  Created by Wang Yu on 12/29/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

/*
    var billSchema = mongoose.Schema({
    _id: {type: String, default: uuid.v4},
    title: String,
    description: String,
    time: {type: Date, default: Date.now},
    photoId: String,
    amounts: [{person: {type: String, ref: 'Person'}, balance: Number}],
    isPaid: Boolean,
    creator: {type: String, ref: 'Person'},
    isDeleted: {type: Boolean, default: false}
    });
*/

class Bill: NSObject {
    
    var _id: String!
    var title: String!
    var time: NSDate!
    var photoId: String!
    var amounts: [Person: Double]!
    var isPaid: Bool!
    var creator: Person!
    var isDeleted: Bool!

    override init() {
        super.init()
    }
    
}
