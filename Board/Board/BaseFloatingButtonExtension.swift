//
//  BaseFloatingButtonExtension.swift
//  Board
//
//  Created by Wang Yu on 1/10/16.
//  Copyright © 2016 Wang Yu. All rights reserved.
//

import UIKit

extension BaseViewController: LiquidFloatingActionButtonDataSource, LiquidFloatingActionButtonDelegate {
    
    func setupFloatingButton() {
        let createButton: (CGRect, LiquidFloatingActionButtonAnimateStyle) -> LiquidFloatingActionButton = { (frame, style) in
            let floatingActionButton = LiquidFloatingActionButton(frame: frame)
            floatingActionButton.animateStyle = style
            floatingActionButton.dataSource = self
            floatingActionButton.delegate = self
            return floatingActionButton
        }
        let cellFactory: (String) -> LiquidFloatingCell = { iconName in
            return LiquidFloatingCell(icon: UIImage(named: iconName)!)
        }
        cells.append(cellFactory("writeBill"))
        cells.append(cellFactory("camera"))
        cells.append(cellFactory("refund"))
        
        let floatingFrame = CGRectMake(self.view.frame.width - 80, self.view.frame.height - 80, 52, 52)
        floatingActionButton = createButton(floatingFrame, .Up)
        floatingActionButton.color = UIColor.fb_mediumBlue()
        self.view.addSubview(floatingActionButton)
        setupFloatingButtonPanAnimation()
    }
    
    func setupFloatingButtonPanAnimation() {
        let panGesture = UIPanGestureRecognizer(target: self, action: "panned:")
        self.floatingActionButton.addGestureRecognizer(panGesture)
        panAnimator = UIDynamicAnimator(referenceView: self.view)
    }
    
    func numberOfCells(liquidFloatingActionButton: LiquidFloatingActionButton) -> Int {
        return cells.count
    }
    
    func cellForIndex(index: Int) -> LiquidFloatingCell {
        return cells[index]
    }
    
    func liquidFloatingActionButton(liquidFloatingActionButton: LiquidFloatingActionButton, didSelectItemAtIndex index: Int) {
        switch index {
        case 0:
            self.performSegueWithIdentifier(SegueIdentifier.AddBill, sender: self)
            break
        case 1:
            break
        case 2:
            break
        default:
            break
        }
        liquidFloatingActionButton.close()
    }
    
    func panned(sender: UIPanGestureRecognizer) {
        let touchPointView = sender.locationInView(self.view)
        let touchPointButton = sender.locationInView(self.floatingActionButton)
        switch sender.state {
        case .Began:
            panAnimator.removeAllBehaviors()
            let centerOffset = UIOffsetMake(touchPointButton.x - CGRectGetMidX(floatingActionButton.bounds), touchPointButton.y - CGRectGetMidY(floatingActionButton.bounds))
            attachmentBehavior = UIAttachmentBehavior(item: floatingActionButton, offsetFromCenter: centerOffset, attachedToAnchor: touchPointView)
            attachmentBehavior.frequency = 0
            panAnimator.addBehavior(attachmentBehavior)
            break;
        case .Changed:
            attachmentBehavior.anchorPoint = touchPointView
            break;
        case .Ended, .Cancelled, .Failed:
            panAnimator.removeBehavior(attachmentBehavior)
            snapBehavior = UISnapBehavior(item: floatingActionButton, snapToPoint: snapPoint)
            panAnimator.addBehavior(snapBehavior)
            break;
        default: break;
        }
    }
 
}