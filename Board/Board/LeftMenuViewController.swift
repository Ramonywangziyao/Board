//
//  LeftMenuViewController.swift
//  Board
//
//  Created by Wang Yu on 12/26/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit
import RESideMenu
import ReactiveCocoa

class LeftMenuViewController: UIViewController, RESideMenuDelegate {

    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButton.rac_signalForControlEvents(.TouchUpInside)
            .toSignalProducer()
            .map { $0 as! UIButton }
            .startWithNext { button in
                UserInfo.logout()
        }
    }
    
}
