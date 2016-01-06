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
    
    func getUserPortrait() -> String {
        return userDefault.stringForKey(UserKeys.Portrait) ?? ""
    }
    
    func getUserId() -> String {
        return userDefault.stringForKey(UserKeys.Id) ?? ""
    }
    
    func getUserCoverPhoto() -> String {
        return userDefault.stringForKey(UserKeys.CoverPhoto) ?? ""
    }
    
    lazy var isLoggedIn: () -> Bool = {
        return self.getUserId() != ""
    }
    
    func facebookLogin(token: String, completion:(succ: Bool, error: String?, result: [String: AnyObject]?) -> ()) {
        if FBSDKAccessToken.currentAccessToken() != nil {
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, email, picture.type(normal), cover"]).startWithCompletionHandler({ (connection, result, error) -> Void in
                if error == nil {
                    print(result)
                    self.userDefault.setObject(result["id"], forKey: UserKeys.Id)
                    self.userDefault.setObject(result["name"], forKey: UserKeys.Name)
                    self.userDefault.setObject(result["email"], forKey: UserKeys.Email)
                    self.userDefault.setObject(((result["picture"]! as! [String: AnyObject])["data"]! as! [String: AnyObject])["url"]!, forKey: UserKeys.Portrait)
                    self.userDefault.setObject((result["cover"] as! [String: AnyObject])["source"], forKey: UserKeys.CoverPhoto)
                    self.userDefault.synchronize()
                    //TODO: upload facebook user data to server
                    completion(succ: true, error: nil, result: nil)
                } else {
                    completion(succ: false, error: error.description, result: nil)
                }
            })
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
