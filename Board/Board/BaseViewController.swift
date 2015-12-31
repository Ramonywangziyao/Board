//
//  BaseViewController.swift
//  Board
//
//  Created by Wang Yu on 12/26/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit
import AMScrollingNavbar
import Spring
import ZFDragableModalTransition

class BaseViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var topBarView: DesignableView!
    var animator: ZFModalTransitionAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScrollView.delegate = self
        segmentControl.addTarget(self, action: "segmentControlDidChanged:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if let navigationController = self.navigationController as? ScrollingNavigationController {
            topBarView.snp_makeConstraints{ make in
                make.top.equalTo(navigationController.navigationBar.snp_bottom)
                make.left.equalTo(self.view.snp_left)
                make.right.equalTo(self.view.snp_right)
                make.height.equalTo(Constants.TopBarHeight)
            }
        }
    }

    func segmentControlDidChanged(segmentControl: UISegmentedControl) {
        let point = CGPointMake(UIScreen.mainScreenWidth * CGFloat(segmentControl.selectedSegmentIndex), 0)
        mainScrollView.setContentOffset(point, animated: true)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if let scrollView = mainScrollView {
            segmentControl.selectedSegmentIndex = Int(scrollView.contentOffset.x / UIScreen.mainScreenWidth)
            if segmentControl.selectedSegmentIndex == 1 {
                if let navigationController = self.navigationController as? ScrollingNavigationController {
                    navigationController.showNavbar(animated: true)
                }
            }
        }
    }
    
    @IBAction func menuButtonDidPressed(sender: UIBarButtonItem) {
        self.sideMenuViewController.presentLeftMenuViewController()
    }
}

