//
//  Person.swift
//  Board
//
//  Created by Wang Yu on 12/29/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding {
    
    var _id: String
    var facebookId: String
    var accessToken: String
    var bills: [String]?
    var boards: [String]?
    var createdAt: NSDate
    var lastLoginAt: NSDate

    struct Keys {
        static let _id = "PersonId"
        static let facebookId = "PersonFacebookId"
        static let accessToken = "PersonAccessToken"
        static let bills = "PersonBills"
        static let boards = "PersonBoards"
        static let createdAt = "PersonCreatedAt"
        static let lastLoginAt = "PersonLastLoginAt"
    }
    
    init(_id: String, facebookId: String, accessToken: String, bills: [String]?=nil, boards: [String]?=nil, createdAt: NSDate, lastLoginAt: NSDate) {
        self._id = _id
        self.facebookId = facebookId
        self.accessToken = accessToken
        self.bills = bills
        self.boards = boards
        self.createdAt = createdAt
        self.lastLoginAt = lastLoginAt
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let _id = aDecoder.decodeObjectForKey(Keys._id) as? String,
            let facebookId = aDecoder.decodeObjectForKey(Keys.facebookId) as? String,
            let accessToken = aDecoder.decodeObjectForKey(Keys.accessToken) as? String,
            let bills = aDecoder.decodeObjectForKey(Keys.bills) as? [String]?,
            let boards = aDecoder.decodeObjectForKey(Keys.boards) as? [String]?,
            let createdAt = aDecoder.decodeObjectForKey(Keys.createdAt) as? NSDate,
            let lastLoginAt = aDecoder.decodeObjectForKey(Keys.lastLoginAt) as? NSDate
            else { fatalError() }
        self._id = _id
        self.facebookId = facebookId
        self.accessToken = accessToken
        self.bills = bills
        self.boards = boards
        self.createdAt = createdAt
        self.lastLoginAt = lastLoginAt
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(_id, forKey: Keys._id)
        aCoder.encodeObject(facebookId, forKey: Keys.facebookId)
        aCoder.encodeObject(accessToken, forKey: Keys.accessToken)
        aCoder.encodeObject(bills, forKey: Keys.bills)
        aCoder.encodeObject(boards, forKey: Keys.boards)
        aCoder.encodeObject(createdAt, forKey: Keys.createdAt)
        aCoder.encodeObject(lastLoginAt, forKey: Keys.lastLoginAt)
    }
    
}
