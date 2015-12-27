//
//  BillViewController.swift
//  Board
//
//  Created by Wang Yu on 12/26/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit
import PullToBounce

class BillViewController: UIViewController {

    var tableView: BillTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bodyView = UIView()
        bodyView.backgroundColor = UIColor.fb_mediumBlue()
        bodyView.frame = self.view.frame
        self.view.addSubview(bodyView)
        
        let tableView = BillTableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        
        let tableViewWrapper = PullToBounceWrapper(scrollView: tableView)
        bodyView.addSubview(tableViewWrapper)
        tableViewWrapper.didPullToRefresh = {
            dispatch_delay(2) {
                tableViewWrapper.stopLoadingAnimation()
            }
        }
    }
    
}
