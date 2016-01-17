//
//  LoginViewController.swift
//  Board
//
//  Created by Wang Yu on 12/28/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import WYMaterialButton
import ReactiveCocoa

class LoginViewController: UIViewController {

    @IBOutlet weak var facebookLoginButton: WYMaterialButton!
    private var loginSucceed: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        facebookLoginButton.rac_signalForControlEvents(.TouchUpInside)
        .subscribeNext { (button) -> Void in
            let readPermissions = ["public_profile", "email", "user_friends"]
            FBSDKLoginManager().logInWithReadPermissions(readPermissions, fromViewController: self) {
                (result: FBSDKLoginManagerLoginResult!, error) -> Void in
                if error != nil {
                    print("Login Error: \(error)")
                } else if result.isCancelled {
                    print("Login Cancelled")
                } else {
                    print("Login Succeed")
                    self.handleFBLoginResult(result)
                }
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if loginSucceed == false {
            dispatch_delay(0.3) {
                self.navigationController?.setNavigationBarHidden(true, animated: true)
                UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
            }
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if loginSucceed {
            facebookLoginButton.animation = "fall"
            facebookLoginButton.animate()
        }
    }
    
    func handleFBLoginResult(result: FBSDKLoginManagerLoginResult!) {
        UserInfo.facebookLogin(result.token.tokenString) { (succ, error, result) -> () in
            if succ {
                self.loginSucceed = true
                print(UserInfo.getUserName())
                print(UserInfo.getUserEmail())
                print(UserInfo.getUserAvatar())
                print(UserInfo.getUserCoverPhoto() ?? "No Cover Photo")
                self.performSegueWithIdentifier(SegueIdentifier.Login, sender: nil)
                self.navigationController?.setNavigationBarHidden(false, animated: true)
                UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
            } else {
                print("Login Failed!")
            }
        }
    }
    
}
