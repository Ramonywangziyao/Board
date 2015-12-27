//
//  ViewController.swift
//  Board
//
//  Created by Wang Yu on 12/26/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScrollView.delegate = self
        segmentControl.addTarget(self, action: "segmentControlDidChanged:", forControlEvents: UIControlEvents.ValueChanged)
    }

    func segmentControlDidChanged(segmentControl: UISegmentedControl) {
        let point = CGPointMake(UIScreen.mainScreenWidth * CGFloat(segmentControl.selectedSegmentIndex), 0)
        mainScrollView.setContentOffset(point, animated: true)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if scrollView == mainScrollView {
            segmentControl.selectedSegmentIndex = Int(scrollView.contentOffset.x / UIScreen.mainScreenWidth)
        }
    }
    
    @IBAction func menuButtonDidPressed(sender: UIBarButtonItem) {
        self.sideMenuViewController.presentLeftMenuViewController()
    }
}

