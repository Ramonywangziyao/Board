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
    static let StandardPadding: CGFloat = 8
}

struct UserKeys {
    static let Id = "userID"
    static let Name = "userName"
    static let Token = "userToken"
    static let Email = "userEmail"
    static let Avatar = "userAvatar"
    static let CoverPhoto = "userCoverPhoto"
}

struct SegueIdentifier {
    static let Login = "LoginSegue"
    static let DetailBill = "DetailBillSegue"
    static let AddBill = "AddBillSegue"
    static let Logout = "LogoutSegue"
}

struct ViewControllerIdentifier {
    static let ContentNav = "ContentNavigationController"
    static let LeftMenu = "LeftMenuViewController"
    static let Login = "LoginNavController"
    static let RootView = "RootViewController"
}

struct SeralizationKeys {
    static let Board = "Board"
    static let Bill = "Bill"
    static let Person = "Person"
    static let Payment = "Payment"
}


extension UIColor {
    class func fb_darkBlue() -> UIColor { return UIColor(hexCode: "#0e1f56") }
    class func fb_blue() -> UIColor { return UIColor(hexCode: "#3b5998") }
    class func fb_mediumBlue() -> UIColor { return UIColor(hexCode: "#6d84b4") }
    class func fb_lightBlue() -> UIColor { return UIColor(hexCode: "#afbdd4") }
    class func fb_white() -> UIColor { return UIColor(hexCode: "#f7f7f7") }
}
    