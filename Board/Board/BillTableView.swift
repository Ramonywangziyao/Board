//
//  TableView.swift
//  PullToBounce
//
//  Created by Takuya Okamoto on 2015/08/12.
//  Copyright (c) 2015年 Uniface. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class BillTableView: UITableView {
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.registerClass(BillTableViewCell.self, forCellReuseIdentifier: "BillTableViewCell")
        self.separatorStyle = UITableViewCellSeparatorStyle.None
        self.backgroundView?.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}