//
//  IdStringExtension.swift
//  Board
//
//  Created by Wang Yu on 1/15/16.
//  Copyright © 2016 Wang Yu. All rights reserved.
//

import UIKit

extension String {
    
    func idToPerson() -> Person? {
        return DataService.currentBoard?.allMembers.filter { $0._id == self }.first
    }
    
    func idToBill() -> Bill? {
        return DataService.currentBoard?.bills?.filter { $0._id == self }.first
    }
    
    func idToBoard() -> Board? {
        return DataService.getBoard(id: self)
    }
    
    func idToPayment() -> Payment? {
        return DataService.currentBoard?.payments?.filter { $0._id == self }.first
    }
    
}
