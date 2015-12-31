//
//  AddBillViewController.swift
//  Board
//
//  Created by Wang Yu on 12/31/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

class DetailBillViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    private let topOffset: CGFloat = 128
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewShadow()
        setupScrollView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
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
    }
    
    @IBAction func exitMaskButtonDidPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
