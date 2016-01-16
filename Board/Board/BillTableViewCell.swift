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
    
    var backView: UIView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .None
        self.backgroundColor = UIColor.clearColor()
        
        backView = UIView()
        backView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
        self.addSubview(backView)
        backView.snp_makeConstraints { make in
            make.top.equalTo(self.snp_top).offset(4)
            make.left.equalTo(self.snp_left)
            make.right.equalTo(self.snp_right)
            make.bottom.equalTo(self.snp_bottom)
            make.height.equalTo(92)
        }
        fakeView(backView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fakeView(view: UIView) {
        let iconMock = UIView()
        iconMock.backgroundColor = UIColor.fb_lightBlue()
        iconMock.frame = CGRect(x: 16, y: 16, width: 60, height: 60)
        iconMock.layer.cornerRadius = 10
        view.addSubview(iconMock)
        
        let lineLeft:CGFloat = iconMock.frame.right + 16
        let lineMargin:CGFloat = 12
        
        let line1 = CGRect(x: lineLeft, y: 12 + lineMargin, width: 100, height: 6)
        let line2 = CGRect(x: lineLeft, y: line1.bottom + lineMargin, width: 160, height: 5)
        let line3 = CGRect(x: lineLeft, y: line2.bottom + lineMargin, width: 180, height: 5)
        func addLine(frame:CGRect) {
            let line = UIView(frame:frame)
            line.layer.cornerRadius = frame.height / 2
            line.backgroundColor = UIColor.fb_lightBlue()
            view.addSubview(line)
        }
        addLine(line1)
        addLine(line2)
        addLine(line3)
    }

}
