//
//  Bill.swift
//  Board
//
//  Created by Wang Yu on 12/29/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

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
