//
//  UserService.swift
//  Board
//
//  Created by Wang Yu on 12/28/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import FBSDKCoreKit
import FBSDKShareKit

var UserInfo = UserService()

class UserService: NSObject {

    let userDefault: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    func getUserName() -> String {
        return userDefault.stringForKey(UserKeys.Name) ?? ""
    }
    
    func getUserEmail() -> String {
        return userDefault.stringForKey(UserKeys.Email) ?? ""
    }
    
    func getUserPortrait() -> NSURL? {
        return userDefault.URLForKey(UserKeys.Portrait)
    }
    
    func facebookLogin(token: String, completion:(succ: Bool, error: String?, result: [String: AnyObject]?) -> ()) {
        print(token)
        if FBSDKAccessToken.currentAccessToken() != nil {
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, email, picture.type(large)"]).startWithCompletionHandler({ (connection, result, error) -> Void in
                if error == nil {
                    print(result)
                    self.userDefault.setObject(result["id"], forKey: UserKeys.Id)
                    self.userDefault.setObject(result["name"], forKey: UserKeys.Name)
                    self.userDefault.setObject(result["email"], forKey: UserKeys.Email)
                    self.userDefault.setObject(((result["picture"]! as! [String: AnyObject])["data"]! as! [String: AnyObject])["url"]!, forKey: UserKeys.Portrait)
                    self.userDefault.synchronize()
                    completion(succ: true, error: nil, result: nil)
                    // upload facebook user data
                } else {
                    completion(succ: false, error: error.description, result: nil)
                }
            })
        }
    }
    
    var token = NSMutableArray()
    
    func getFriends() {
        if FBSDKAccessToken.currentAccessToken() != nil {
            FBSDKGraphRequest(graphPath: "/me/taggable_friends", parameters: nil).startWithCompletionHandler { (connection, result, error) -> Void in
                if error == nil{
                    print(result)
                    for val in result["data"] as! [AnyObject]{
                        self.token.addObject(val["id"] as! String)
                    }
                }
            }
        }
    }
    
    func getMutualFriends() {
        if FBSDKAccessToken.currentAccessToken() != nil {
            FBSDKGraphRequest(graphPath: "/me/friends", parameters: ["fields":"name,installed,first_name"]).startWithCompletionHandler { (connection, result, error) -> Void in
                if error == nil{
                    print(result)
                }
            }
        }
    }
    
    func logout() {
        userDefault.setNilValueForKey(UserKeys.Id)
        userDefault.setNilValueForKey(UserKeys.Email)
        userDefault.setNilValueForKey(UserKeys.Name)
        userDefault.setNilValueForKey(UserKeys.Portrait)
        userDefault.setNilValueForKey(UserKeys.Token)
        userDefault.synchronize()
    }
}
