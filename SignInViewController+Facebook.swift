//
//  SignIn+Fb.swift
//  Odoo Marketplace
//
//  Created by bhavuk.chawla on 24/07/18.
//  Copyright © 2018 bhavuk.chawla. All rights reserved.
//

import Foundation
import FBSDKLoginKit

class MobikulFBSignIn: NSObject{
    
    override init() {
        super.init()
        let view = UIApplication.shared.delegate?.window
        if let viewController = view??.rootViewController {
            self.fbLogin(view: viewController)
        }
        
    }
    
    func fbLogin(view: UIViewController) {
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email", "user_friends"], from: view) { (result, error) -> Void in
            if (error == nil){
                if let fbloginresult : FBSDKLoginManagerLoginResult = (result)
                {
                    if(fbloginresult.isCancelled){
                        
                    }
                    else{
                        if(fbloginresult.grantedPermissions.contains("email"))
                        {
                            self.getFBUserData()
                        }
                    }
                }
            }
        }
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    let Dict  = result as? [String : Any]
                    NotificationCenter.default.post(name:  NSNotification.Name(rawValue: "MobikulFBSignIn"), object: nil, userInfo: Dict)
                }
                
            })
        }
    }
    
}




