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
    
    private let topOffset: CGFloat = 128
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
            $0.top.equalTo(self.view.snp_top).offset(self.topOffset)
            $0.left.equalTo(self.view.snp_left)
            $0.right.equalTo(self.view.snp_right)
            $0.bottom.equalTo(self.view.snp_bottom)
        }
        scrollView.panGestureRecognizer.addTarget(self, action: "handlePan:")
    }
    
    func handlePan(sender: UIPanGestureRecognizer) {
        let offset = sender.translationInView(self.view).y
        let velocity = sender.velocityInView(self.view).y
        
        switch scrollView.panGestureRecognizer.state {
        case UIGestureRecognizerState.Began:
            if velocity.isSignMinus && contentToTopOffset != Constants.StatusBarHieght {
                scrollView.scrollEnabled = false
            }
            break;
        case UIGestureRecognizerState.Changed:
            if contentToTopOffset != Constants.StatusBarHieght && offset >= 0 {
                scrollView.snp_updateConstraints {
                    $0.top.equalTo(self.view.snp_top).offset(contentToTopOffset + offset)
                    $0.top.equalTo(self.view.snp_bottom)
                }
            }
            break;
        case UIGestureRecognizerState.Ended,
            UIGestureRecognizerState.Cancelled,
            UIGestureRecognizerState.Failed:
            if velocity.isSignMinus {
                springAnimation({ () -> () in
                    self.scrollView.frame = CGRectMake(0, Constants.StatusBarHieght, self.view.frame.width, self.view.frame.height - Constants.StatusBarHieght)
                }, completion: { () -> () in
                    self.scrollView.snp_updateConstraints {
                        $0.top.equalTo(self.view.snp_top).offset(Constants.StatusBarHieght)
                    }
                    self.contentToTopOffset = Constants.StatusBarHieght
                    self.scrollView.scrollEnabled = true
                })
            } else {
                springAnimation({ () -> () in
                    self.scrollView.frame = CGRectMake(0, self.topOffset, self.view.frame.width, self.view.frame.height - self.topOffset)
                }, completion: { () -> () in
                    self.scrollView.snp_updateConstraints {
                        $0.top.equalTo(self.view.snp_top).offset(self.topOffset)
                    }
                    self.contentToTopOffset = self.topOffset
                })
            }
            break;
        default:
            break;
        }
    }
    
    func springAnimation(during: () -> (), completion: () -> ()) {
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                during()
            }, completion: { (finished) -> Void in
                completion()
        })
    }
    
    @IBAction func exitMaskButtonDidPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
