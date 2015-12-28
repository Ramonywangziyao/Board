//
//  DZNEmptyDataExtension.swift
//  Board
//
//  Created by Wang Yu on 12/26/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

extension BalanceViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {

    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "empty_box_img")
    }
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let textAttributes = [
            NSForegroundColorAttributeName: UIColor.lightGrayColor(),
            NSFontAttributeName: UIFont(name: "Helvetica", size: 17)!,
        ]
        return NSAttributedString(string: "No People", attributes: textAttributes)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let textAttributes = [
            NSForegroundColorAttributeName: UIColor.lightGrayColor(),
            NSFontAttributeName: UIFont(name: "Helvetica", size: 14)!,
        ]
        return NSAttributedString(string: "There is no record around, please setup your group and add your members! ", attributes: textAttributes)
    }
    
    func emptyDataSetShouldAllowScroll(scrollView: UIScrollView!) -> Bool {
        return true
    }
}
