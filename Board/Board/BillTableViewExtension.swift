//
//  BillTableViewExtension.swift
//  Board
//
//  Created by Wang Yu on 12/26/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

extension BillViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
        return 24
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BillTableViewCell", forIndexPath: indexPath) as! BillTableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if !preventAnimation.contains(indexPath) {
            preventAnimation.insert(indexPath)
            CellAnimator.animate(cell as! BillTableViewCell)
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = self.tableView.cellForRowAtIndexPath(indexPath) as! BillTableViewCell
        UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            cell.backView.alpha = 0.5
            }) { (finished) -> Void in
                dispatch_delay(0.3) {
                    cell.backView.alpha = 1
                }
        }
        self.performSegueWithIdentifier(SegueIdentifier.DetailBill, sender: self)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let velocity = scrollView.panGestureRecognizer.velocityInView(self.tableView).y
        let floatingButton = (self.parentViewController as! BaseViewController).floatingActionButton
        if floatingButton.isClosed == false { floatingButton.close() }
        if velocity.isSignMinus {
            floatingButton.animate(isAppearing: false)
        } else if velocity > 32 {
            floatingButton.animate(isAppearing: true)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == SegueIdentifier.DetailBill {
            let detailBillViewController = segue.destinationViewController as! DetailBillViewController
            self.animator = ZFModalTransitionAnimator(modalViewController: detailBillViewController)
            self.animator.dragable = true
            self.animator.direction = ZFModalTransitonDirection.Bottom
            self.animator.setContentScrollView(detailBillViewController.scrollView)
            detailBillViewController.transitioningDelegate = self.animator
            detailBillViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        }
    }
    
}
