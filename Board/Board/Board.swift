//
//  Board.swift
//  Board
//
//  Created by Wang Yu on 12/29/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

class Board: NSObject, NSCoding {
    
    var _id: String
    var name: String
    var isActive: Bool
    var creator: Person
    var members: [Person]?
    var bills: [Bill]?
    var payments: [Payment]?
    var isCleared: Bool
    var createdAt: NSDate
    
    struct Keys {
        static let _id = "BoardId"
        static let name = "BoardName"
        static let isActive = "BoardIsActive"
        static let creator = "BoardCreator"
        static let members = "BoardMembers"
        static let bills = "BoardBills"
        static let payments = "BoardPayments"
        static let isCleared = "BoardIsCleared"
        static let createdAt = "BoardCreatedAt"
    }
    
    init(_id: String, name: String, creator: Person, members: [Person]?=nil, createdAt: NSDate) {
        self._id = _id
        self.name = name
        self.creator = creator
        self.members = members
        self.createdAt = createdAt
        self.isActive = true
        self.isCleared = false
        self.bills = nil
        self.payments = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let _id = aDecoder.decodeObjectForKey(Keys._id) as? String,
            let name = aDecoder.decodeObjectForKey(Keys.name) as? String,
            let isActive = aDecoder.decodeObjectForKey(Keys.isActive) as? Bool,
            let creator = aDecoder.decodeObjectForKey(Keys.creator) as? Person,
            let members = aDecoder.decodeObjectForKey(Keys.members) as? [Person]?,
            let bills = aDecoder.decodeObjectForKey(Keys.bills) as? [Bill]?,
            let payments = aDecoder.decodeObjectForKey(Keys.payments) as? [Payment]?,
            let isCleared = aDecoder.decodeObjectForKey(Keys.isCleared) as? Bool,
            let createdAt = aDecoder.decodeObjectForKey(Keys.createdAt) as? NSDate
            else { fatalError() }
        self._id = _id
        self.name = name
        self.isActive = isActive
        self.creator = creator
        self.members = members
        self.bills = bills
        self.payments = payments
        self.isCleared = isCleared
        self.createdAt = createdAt
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(_id, forKey: Keys._id)
        aCoder.encodeObject(name, forKey: Keys.name)
        aCoder.encodeObject(isActive, forKey: Keys.isActive)
        aCoder.encodeObject(creator, forKey: Keys.creator)
        aCoder.encodeObject(members, forKey: Keys.members)
        aCoder.encodeObject(bills, forKey: Keys.bills)
        aCoder.encodeObject(payments, forKey: Keys.payments)
        aCoder.encodeObject(isCleared, forKey: Keys.isCleared)
        aCoder.encodeObject(createdAt, forKey: Keys.createdAt)
    }

}
