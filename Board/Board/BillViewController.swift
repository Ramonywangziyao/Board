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
import SnapKit

class BillViewController: UIViewController, ScrollingNavigationControllerDelegate {

    var tableView: BillTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // for pull to bounce
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
        
        // setup the pull to Bounce
        let tableViewWrapper = PullToBounceWrapper(scrollView: tableView, pullDistance: 88)
        bodyView.addSubview(tableViewWrapper)
        tableViewWrapper.didPullToRefresh = {
            dispatch_delay(2) {
                tableViewWrapper.stopLoadingAnimation()
            }
        }
        
        // self-adjust cell height
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if let navigationController = self.navigationController as? ScrollingNavigationController {
            navigationController.followScrollView(tableView, delay: 50.0)
//            navigationController.scrollingNavbarDelegate = self
            let scrollView = (self.parentViewController as! BaseViewController).mainScrollView
            scrollView.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(navigationController.navigationBar.snp_bottom)
                make.bottom.equalTo(self.view.snp_bottom)
            }
        }
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        if let navigationController = self.navigationController as? ScrollingNavigationController {
            navigationController.stopFollowingScrollView()
        }
    }
    
//    func scrollingNavigationController(controller: ScrollingNavigationController, didChangeState state: NavigationBarState) {
//        let scrollView = (self.parentViewController as! BaseViewController).mainScrollView
//        scrollView.frame.y = controller.navigationBar.frame.bottom
//    }
    
}
