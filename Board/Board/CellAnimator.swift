//
//  TableViewCellAnimation.swift
//  Board
//
//  Created by Wang Yu on 12/30/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit
import QuartzCore

private let TipInCellAnimatorStartTransform: CATransform3D = {
    let rotationDegrees: CGFloat = -15.0
    let rotationRadians: CGFloat = rotationDegrees * (CGFloat(M_PI) / 180.0)
    let offset = CGPointMake(-30, -20)
    var startTransform = CATransform3DIdentity
    startTransform = CATransform3DRotate(CATransform3DIdentity, rotationRadians, 0.0, 0.0, 1.0)
    startTransform = CATransform3DTranslate(startTransform, offset.x, offset.y, 0.0)
    return startTransform
}()

class CellAnimator {
    class func animate(cell: BillTableViewCell) {
        let view = cell.backView
        
        view.layer.transform = TipInCellAnimatorStartTransform
        view.layer.opacity = 0.8
        
        UIView.animateWithDuration(0.4) {
            view.layer.transform = CATransform3DIdentity
            view.layer.opacity = 1
        }
    }
}

