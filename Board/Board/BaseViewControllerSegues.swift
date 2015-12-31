//
//  BillViewControllerSegues.swift
//  Board
//
//  Created by Wang Yu on 12/31/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit
import ZFDragableModalTransition

extension BaseViewController {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == SegueIdentifier.AddBill {
            let addBillViewController = segue.destinationViewController as! AddBillViewController
            self.animator = ZFModalTransitionAnimator(modalViewController: addBillViewController)
            self.animator.dragable = true
            self.animator.direction = ZFModalTransitonDirection.Bottom
            self.animator.setContentScrollView(addBillViewController.scrollView)
            addBillViewController.transitioningDelegate = self.animator
            addBillViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        }
    }
    
}
