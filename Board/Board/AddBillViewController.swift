//
//  AddBillViewController.swift
//  Board
//
//  Created by Wang Yu on 12/31/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

class AddBillViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    private let contentToTopOffset = 128
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewShadow()
        setupScrollView()
    }
    
    func setViewShadow() {
        self.view.layer.shadowColor = UIColor.darkGrayColor().CGColor;
        self.view.layer.shadowOffset = CGSizeMake(-5, 0);
        self.view.layer.shadowOpacity = 0.7;
        self.view.layer.shadowRadius = 5.0;
    }
    
    func setupScrollView() {
        self.scrollView.snp_makeConstraints {
            $0.top.equalTo(self.view.snp_top).offset(contentToTopOffset)
            $0.left.equalTo(self.view.snp_left)
            $0.right.equalTo(self.view.snp_right)
            $0.bottom.equalTo(self.view.snp_bottom)
        }
        scrollView.delegate = self
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }

}
