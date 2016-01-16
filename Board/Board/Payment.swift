//
//  Payment.swift
//  Board
//
//  Created by Wang Yu on 1/15/16.
//  Copyright © 2016 Wang Yu. All rights reserved.
//

import UIKit

class Payment: NSObject, NSCoding {

    let _id: String
    var amount: Double
    var fromPerson: String
    var toPerson: String
    var targetVenmoId: String
    var venmoAudience: String
    
    struct Keys {
        static let _id = "PaymentId"
        static let amount = "PaymentAmount"
        static let fromPerson = "PaymentFromPerson"
        static let toPerson = "PaymentToPerson"
        static let targetVenmoId = "PaymentTargetVenmoId"
        static let venmoAudience = "PaymentVenmoAudience"
    }
    
    init(_id: String, amount: Double, fromPerson: String, toPerson: String, targetVenmoId: String, venmoAudience: String) {
        self._id = _id
        self.amount = amount
        self.fromPerson = fromPerson
        self.toPerson = toPerson
        self.targetVenmoId = targetVenmoId
        self.venmoAudience = venmoAudience
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let _id = aDecoder.decodeObjectForKey(Keys._id) as? String,
            let amount = aDecoder.decodeObjectForKey(Keys.amount) as? Double,
            let fromPerson = aDecoder.decodeObjectForKey(Keys.fromPerson) as? String,
            let toPerson = aDecoder.decodeObjectForKey(Keys.toPerson) as? String,
            let targetVenmoId = aDecoder.decodeObjectForKey(Keys.targetVenmoId) as? String,
            let venmoAudience = aDecoder.decodeObjectForKey(Keys.venmoAudience) as? String
            else { fatalError() }
        self._id = _id
        self.amount = amount
        self.fromPerson = fromPerson
        self.toPerson = toPerson
        self.targetVenmoId = targetVenmoId
        self.venmoAudience = venmoAudience
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(_id, forKey: Keys._id)
        aCoder.encodeObject(amount, forKey: Keys.amount)
        aCoder.encodeObject(fromPerson, forKey: Keys.fromPerson)
        aCoder.encodeObject(toPerson, forKey: Keys.toPerson)
        aCoder.encodeObject(targetVenmoId, forKey: Keys.targetVenmoId)
        aCoder.encodeObject(venmoAudience, forKey: Keys.venmoAudience)
    }
    
}
