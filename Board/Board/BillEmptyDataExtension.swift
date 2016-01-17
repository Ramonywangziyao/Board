//
//  DZNEmptyDataExtension.swift
//  Board
//
//  Created by Wang Yu on 12/26/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

extension BillViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {

    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "empty_box_img")
    }
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let textAttributes = [
            NSForegroundColorAttributeName: UIColor.fb_white(),
            NSFontAttributeName: UIFont(name: "Helvetica", size: 17)!,
        ]
        return NSAttributedString(string: "No Transection", attributes: textAttributes)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let textAttributes = [
            NSForegroundColorAttributeName: UIColor.fb_white(),
            NSFontAttributeName: UIFont(name: "Helvetica", size: 14)!,
        ]
        return NSAttributedString(string: "There is no record around, please press the add button below to start your first bill.", attributes: textAttributes)
    }
    
    func emptyDataSetShouldAllowScroll(scrollView: UIScrollView!) -> Bool {
        return true
    }
}
