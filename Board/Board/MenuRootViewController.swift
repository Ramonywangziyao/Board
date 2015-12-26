//
//  MenuRootViewController.swift
//  Board
//
//  Created by Wang Yu on 12/26/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit
import RESideMenu

class MenuRootViewController: RESideMenu, RESideMenuDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    override func awakeFromNib() {
        self.contentViewController = Main.instantiateViewControllerWithIdentifier("ContentNavigationController") as! UINavigationController
        self.leftMenuViewController = Menu.instantiateViewControllerWithIdentifier("LeftMenuViewController") as! LeftMenuViewController
        self.menuPreferredStatusBarStyle = UIStatusBarStyle.LightContent
    //    self.backgroundImage = UIImage(named: "menu_background.png")
        self.contentViewShadowColor = UIColor.blackColor();
        self.contentViewShadowOffset = CGSizeMake(0, 0);
        self.contentViewShadowOpacity = 0.6;
        self.contentViewShadowRadius = 12;
        self.contentViewShadowEnabled = true;
        self.contentViewScaleValue = 0.88
        self.contentViewInPortraitOffsetCenterX = self.contentViewController.view.center.x - 108
    }

}
