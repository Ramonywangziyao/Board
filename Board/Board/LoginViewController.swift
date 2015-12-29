//
//  LoginViewController.swift
//  Board
//
//  Created by Wang Yu on 12/28/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    var loginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginButton = FBSDKLoginButton()
        self.loginButton.center = self.view.center
        self.loginButton.delegate = self
        self.loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        self.view.addSubview(self.loginButton)
        
        let content = FBSDKShareLinkContent()
        content.contentURL = NSURL(string:"https://www.takefiveinteractive.com")
        content.contentTitle = "This is a test hhahahhahaahha"
        content.peopleIDs = ["739437159512298"]
        let button = FBSDKShareButton()
        button.center = CGPointMake(self.view.center.x, self.view.center.y + 48)
        button.shareContent = content
        button.userInteractionEnabled = true
        self.view.addSubview(button)
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        UserInfo.facebookLogin(result.token.description) { (succ, error, result) -> () in
            if succ {
                print(UserInfo.getUserName())
                print(UserInfo.getUserEmail())
                print(UserInfo.getUserPortrait()!)
                self.performSegueWithIdentifier(SegueKeys.Login, sender: loginButton)
            } else {
                print("Login Failed!")
            }
        }
    }

    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        UserInfo.logout()
    }
    
}
