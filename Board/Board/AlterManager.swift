//
//  AlterManager.swift
//  Board
//
//  Created by Wang Yu on 1/7/16.
//  Copyright © 2016 Wang Yu. All rights reserved.
//

import UIKit
import CRToast

class AlterManager: NSObject {
    
    static let alterBackgroundColor = UIColor.redColor()

    class func showNavBarNotification(alterText: String, completion: () -> ()) {
        let options: Dictionary<NSObject, AnyObject> = [
            kCRToastTextKey: alterText,
            kCRToastTextAlignmentKey: NSTextAlignment.Center.rawValue,
            kCRToastBackgroundColorKey: alterBackgroundColor,
            kCRToastAnimationInTypeKey: CRToastAnimationType.Gravity.rawValue,
            kCRToastAnimationOutTypeKey: CRToastAnimationType.Gravity.rawValue,
            kCRToastAnimationInDirectionKey: CRToastAnimationDirection.Top.rawValue,
            kCRToastAnimationOutDirectionKey: CRToastAnimationDirection.Top.rawValue,
            kCRToastNotificationTypeKey: CRToastType.NavigationBar.rawValue,
            kCRToastNotificationPresentationTypeKey: CRToastPresentationType.Cover.rawValue
        ]
        CRToastManager.showNotificationWithOptions(options, completionBlock: completion)
    }
    
    class func showStatusBarNotification(alterText: String, completion: () -> ()) {
        let options: Dictionary<NSObject, AnyObject> = [
            kCRToastTextKey: alterText,
            kCRToastTextAlignmentKey: NSTextAlignment.Center.rawValue,
            kCRToastBackgroundColorKey: alterBackgroundColor,
            kCRToastAnimationInTypeKey: CRToastAnimationType.Gravity.rawValue,
            kCRToastAnimationOutTypeKey: CRToastAnimationType.Gravity.rawValue,
            kCRToastAnimationInDirectionKey: CRToastAnimationDirection.Top.rawValue,
            kCRToastAnimationOutDirectionKey: CRToastAnimationDirection.Top.rawValue,
            kCRToastNotificationTypeKey: CRToastType.StatusBar.rawValue,
            kCRToastNotificationPresentationTypeKey: CRToastPresentationType.Cover.rawValue
        ]
        CRToastManager.showNotificationWithOptions(options, completionBlock: completion)
    }

}
