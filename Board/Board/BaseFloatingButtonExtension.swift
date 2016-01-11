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
        
        let floatingFrame = CGRectMake(self.view.frame.width - 72, self.view.frame.height - 72, 50, 50)
        floatingActionButton = createButton(floatingFrame, .Up)
        floatingActionButton.color = UIColor.fb_mediumBlue()
        self.view.addSubview(floatingActionButton)
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
    
 
}