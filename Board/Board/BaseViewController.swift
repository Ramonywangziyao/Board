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

class BaseViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var billTableButton: UIButton!
    @IBOutlet weak var balanceTableButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var animator: ZFModalTransitionAnimator!
    var floatingActionButton: LiquidFloatingActionButton!
    var cells: [LiquidFloatingCell] = []
    var currentSegmentIndex = 0 {
        didSet {
            let point = CGPointMake(CGFloat(currentSegmentIndex)  * UIScreen.mainScreenWidth, 0)
            mainScrollView.setContentOffset(point, animated: true)
            self.floatingActionButton.animate(isAppearing: currentSegmentIndex == 0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScrollView.delegate = self
        setupFloatingButton()
        setupBackgroundView()
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

    @IBAction func billTableButtonDidClicked(sender: UIButton) {
        currentSegmentIndex = 0
    }
    
    @IBAction func balanceTableButtonDidClicked(sender: UIButton) {
        currentSegmentIndex = 1
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if let scrollView = mainScrollView {
            currentSegmentIndex = Int(scrollView.contentOffset.x / UIScreen.mainScreenWidth)
            if currentSegmentIndex == 1 {
                if let navigationController = self.navigationController as? ScrollingNavigationController {
                    navigationController.showNavbar(animated: true)
                }
            }
            self.floatingActionButton.animate(isAppearing: currentSegmentIndex == 0)
        }
    }
    
    @IBAction func menuButtonDidPressed(sender: UIBarButtonItem) {
        self.sideMenuViewController.presentLeftMenuViewController()
    }
    
    func setupBackgroundView() {
        var motionEffects: UIMotionEffectGroup {
            let yTilt = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
            yTilt.minimumRelativeValue = 12
            yTilt.maximumRelativeValue = 12
            let xTilt = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
            xTilt.minimumRelativeValue = 12
            xTilt.maximumRelativeValue = 12
            let effects = UIMotionEffectGroup()
            effects.motionEffects = [yTilt, xTilt]
            return effects
        }
        self.backgroundImageView.addMotionEffect(motionEffects)
    }
 
}

