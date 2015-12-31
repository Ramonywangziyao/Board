//
//  BillViewController.swift
//  Board
//
//  Created by Wang Yu on 12/26/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit
import PullToBounce
import AMScrollingNavbar

class BillViewController: UIViewController {

    var tableView: BillTableView!
    var preventAnimation = Set<NSIndexPath>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // body view for pull to bounce
        let bodyView = UIView()
        bodyView.backgroundColor = UIColor.fb_mediumBlue()
        bodyView.frame = self.view.frame
        self.view.addSubview(bodyView)
        
        // init table view
        tableView = BillTableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        
        // setup pull to Bounce
        let tableViewWrapper = PullToBounceWrapper(scrollView: tableView, pullDistance: 88)
        bodyView.addSubview(tableViewWrapper)
        tableViewWrapper.didPullToRefresh = {
            dispatch_delay(2) {
                tableViewWrapper.stopLoadingAnimation()
            }
        }
        
        // self-adjust cell height
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if let navigationController = self.navigationController as? ScrollingNavigationController {
            navigationController.followScrollView(tableView, delay: 50.0)
        }
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        if let navigationController = self.navigationController as? ScrollingNavigationController {
            navigationController.stopFollowingScrollView()
            navigationController.showNavbar(animated: true)
        }
        preventAnimation.removeAll()
    }
    
}
