//
//  BillTableViewCell.swift
//  Board
//
//  Created by Wang Yu on 12/26/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit
import SnapKit

class BillTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor.clearColor()
        self.backgroundColor = UIColor.clearColor()
        
        let iconMock = UIView()
        iconMock.backgroundColor = UIColor.fb_lightBlue()
        iconMock.frame = CGRect(x: 16, y: 16, width: 60, height: 60)
        iconMock.layer.cornerRadius = 10
        self.addSubview(iconMock)
        
        let lineLeft:CGFloat = iconMock.frame.right + 16
        let lineMargin:CGFloat = 12
        
        let line1 = CGRect(x: lineLeft, y: 12 + lineMargin, width: 100, height: 6)
        let line2 = CGRect(x: lineLeft, y: line1.bottom + lineMargin, width: 160, height: 5)
        let line3 = CGRect(x: lineLeft, y: line2.bottom + lineMargin, width: 180, height: 5)
        addLine(line1)
        addLine(line2)
        addLine(line3)
        
        let sepalator = UIView()
        sepalator.frame = CGRect(x: 0, y: 92 - 1, width: frame.width, height: 1)
        sepalator.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.2)
        self.addSubview(sepalator)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addLine(frame:CGRect) {
        let line = UIView(frame:frame)
        line.layer.cornerRadius = frame.height / 2
        line.backgroundColor = UIColor.fb_lightBlue()
        self.addSubview(line)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
