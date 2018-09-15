//
//  MobikulFacebookSigninView.swift
//  Odoo Marketplace
//
//  Created by bhavuk.chawla on 01/08/18.
//  Copyright © 2018 bhavuk.chawla. All rights reserved.
//

import UIKit

class MobikulFacebookSigninView: UIView {
    @IBOutlet weak var fbBtn: UIButton!

    
    @IBAction func facebookClicked(_ sender: UIButton) {
         NotificationCenter.default.post(name:  NSNotification.Name(rawValue: "MobikulFacebookSigninViewClicked"), object: nil)
    }
}
