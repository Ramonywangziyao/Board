//
//  Bill.swift
//  Board
//
//  Created by Wang Yu on 12/29/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

class Bill: NSObject, NSCoding {
    
    var _id: String
    var title: String
    var time: NSDate
    var photoId: String
    var amounts: [Person: Double]
    var isPaid: Bool
    var creator: Person
    var isDeleted: Bool
    
    struct Key {
        static let _id = "BillId"
        static let title = "BillTitle"
        static let time = "BillTime"
        static let photoId = "BillPhotoId"
        static let amounts = "BillAmounts"
        static let isPaid = "BillIsPaid"
        static let creator = "BillCreator"
        static let isDeleted = "BillIsDeleted"
    }
    
    init(_id: String, title: String, time: NSDate, photoId: String, amounts: [Person: Double], isPaid: Bool, creator: Person, isDeleted: Bool) {
        self._id = _id
        self.title = title
        self.time = time
        self.photoId = photoId
        self.amounts = amounts
        self.isPaid = isPaid
        self.creator = creator
        self.isDeleted = isDeleted
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        guard let _id = aDecoder.decodeObjectForKey(Key._id) as? String,
            let title = aDecoder.decodeObjectForKey(Key.title) as? String,
            let time = aDecoder.decodeObjectForKey(Key.time) as? NSDate,
            let photoId = aDecoder.decodeObjectForKey(Key.photoId) as? String,
            let amounts = aDecoder.decodeObjectForKey(Key.amounts) as? [Person: Double],
            let isPaid = aDecoder.decodeObjectForKey(Key.isPaid) as? Bool,
            let creator = aDecoder.decodeObjectForKey(Key.creator) as? Person,
            let isDeleted = aDecoder.decodeObjectForKey(Key.isDeleted) as? Bool
        else { fatalError() }
        self._id = _id
        self.title = title
        self.time = time
        self.photoId = photoId
        self.amounts = amounts
        self.isPaid = isPaid
        self.creator = creator
        self.isDeleted = isDeleted
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._id, forKey: Key._id)
        aCoder.encodeObject(self.title, forKey: Key.title)
        aCoder.encodeObject(self.time, forKey: Key.time)
        aCoder.encodeObject(self.photoId, forKey: Key.photoId)
        aCoder.encodeObject(self.amounts, forKey: Key.amounts)
        aCoder.encodeObject(self.isPaid, forKey: Key.isPaid)
        aCoder.encodeObject(self.creator, forKey: Key.creator)
        aCoder.encodeObject(self.isDeleted, forKey: Key.isDeleted)
    }
    
}
