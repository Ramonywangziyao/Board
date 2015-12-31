//
//  AddBillViewController.swift
//  Board
//
//  Created by Wang Yu on 12/31/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

class AddBillViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    private var contentToTopOffset: CGFloat = 128
    private var originalScrollViewPoint = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewShadow()
        setupScrollView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        originalScrollViewPoint = scrollView.center
    }
    
    func setViewShadow() {
        self.view.layer.shadowColor = UIColor.darkGrayColor().CGColor;
        self.view.layer.shadowOffset = CGSizeMake(-5, 0);
        self.view.layer.shadowOpacity = 0.7;
        self.view.layer.shadowRadius = 5.0;
    }
    
    func setupScrollView() {
        self.scrollView.snp_makeConstraints {
            $0.top.equalTo(self.view.snp_top).offset(128)
            $0.left.equalTo(self.view.snp_left)
            $0.right.equalTo(self.view.snp_right)
            $0.bottom.equalTo(self.view.snp_bottom)
        }
        scrollView.panGestureRecognizer.addTarget(self, action: "handlePan:")
    }
    
    func handlePan(sender: UIPanGestureRecognizer) {
        let offset = sender.translationInView(self.scrollView).y
        let velocity = sender.velocityInView(self.scrollView).y
        
        switch scrollView.panGestureRecognizer.state {
        case UIGestureRecognizerState.Began:
            if velocity <= 0 {
                scrollView.scrollEnabled = false
            }
            break;
        case UIGestureRecognizerState.Changed:
            if contentToTopOffset != Constants.StatusBarHieght {
                scrollView.snp_updateConstraints {
                    $0.top.equalTo(self.view.snp_top).offset(contentToTopOffset + offset)
                }
                scrollView.setContentOffset(CGPointMake(0, 0), animated: false)
            }
            break;
        case UIGestureRecognizerState.Ended,
            UIGestureRecognizerState.Cancelled,
            UIGestureRecognizerState.Failed:
            if velocity <= 0 {
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    self.scrollView.frame = CGRectMake(0, Constants.StatusBarHieght, self.view.frame.width, self.view.frame.height - Constants.StatusBarHieght)
                }, completion: { (finished) -> Void in
                    self.scrollView.snp_updateConstraints {
                        $0.top.equalTo(self.view.snp_top).offset(Constants.StatusBarHieght)
                    }
                    self.contentToTopOffset = Constants.StatusBarHieght
                    self.scrollView.scrollEnabled = true
                })
            } else {
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    self.scrollView.frame = CGRectMake(0, 128, self.view.frame.width, self.view.frame.height - 128)
                }, completion: { (finished) -> Void in
                    self.scrollView.snp_updateConstraints {
                        $0.top.equalTo(self.view.snp_top).offset(128)
                    }
                    self.contentToTopOffset = 128
                })
            }
            break;
        default:
            break;
        }
    }
    
    @IBAction func exitMaskButtonDidPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
