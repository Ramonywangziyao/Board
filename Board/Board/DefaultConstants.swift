//
//  DefaultConstants.swift
//  Board
//
//  Created by Wang Yu on 12/26/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

let StartStoryboard = UIStoryboard(name: "Start", bundle: nil)
let MainStoryboard = UIStoryboard(name: "Main", bundle: nil)

struct Constants {
    static let TopBarHeight: CGFloat = 40
    static let EntireBarHeight: CGFloat = 64
    static let NavBarHeight: CGFloat = 44
    static let StatusBarHieght: CGFloat = 20
}

struct UserKeys {
    static let Id = "userID"
    static let Name = "userName"
    static let Token = "userToken"
    static let Email = "userEmail"
    static let Portrait = "userPortrait"
    static let CoverPhoto = "userCoverPhoto"
}

struct SegueIdentifier {
    static let Login = "LoginSegue"
    static let DetailBill = "DetailBillSegue"
    static let AddBill = "AddBillSegue"
}

struct ViewControllerIdentifier {
    static let ContentNav = "ContentNavigationController"
    static let LeftMenu = "LeftMenuViewController"
    static let Login = "LoginNavController"
    static let RootView = "RootViewController"
}