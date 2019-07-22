//
//  UserDetailsVCRouter.swift
//  SimpleMVP
//
//  Created by Wael M Elmahask on 7/21/19.
//  Copyright © 2019 Wael M Elmahask. All rights reserved.
//

import UIKit

class UserDetailsVCRouter {
    class var mainStoryboard : UIStoryboard {
        return UIStoryboard(name: "UserDetails", bundle: Bundle.main)
    }
    
    class func createUserDetails(user:UserElement) -> UIViewController {
        let userDetailsVC = mainStoryboard.instantiateViewController(withIdentifier: "UserDetailsVC")
        
        if let userDetailsView = userDetailsVC as? UserDetailsViewDelegate {
            let presenter = UserDetailsVCPresnter(view: userDetailsView, user: user)
            userDetailsView.presnter = presenter
        }
        return userDetailsVC
    }
}
