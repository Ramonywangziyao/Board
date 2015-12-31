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

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    var loginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginButton = FBSDKLoginButton()
        self.loginButton.center = self.view.center
        self.loginButton.delegate = self
        self.loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        self.view.addSubview(self.loginButton)
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        UserInfo.facebookLogin(result.token.description) { (succ, error, result) -> () in
            if succ {
                print(UserInfo.getUserName())
                print(UserInfo.getUserEmail())
                print(UserInfo.getUserPortrait())
                print(UserInfo.getUserCoverPhoto())
                self.performSegueWithIdentifier(SegueIdentifier.Login, sender: loginButton)
            } else {
                print("Login Failed!")
            }
        }
    }

    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        UserInfo.logout()
    }
    
}
