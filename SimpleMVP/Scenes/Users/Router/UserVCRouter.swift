//
//  UserVCRouter.swift
//  SimpleMVP
//
//  Created by Wael M Elmahask on 7/21/19.
//  Copyright © 2019 Wael M Elmahask. All rights reserved.
//

import UIKit

class UserVCRouter {
    
    class var mainStoryboard : UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func createUserVC() -> UIViewController {
        let navigationController = mainStoryboard.instantiateViewController(withIdentifier: "UINavigationController")
        let userView = navigationController.children.first as? UserViewDelegate
        let interactor = UserInteractor()
        let router = UserVCRouter()
        let presenter = UserVCPresenter(view: userView, interactor: interactor,router: router)
        userView?.presenter = presenter
        
        return navigationController
    }
    
    func navigateToDetails(from view:UserViewDelegate?, user:UserElement){
        let userDetailsView = UserDetailsVCRouter.createUserDetails(user: user)
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(userDetailsView, animated: true)
        }
    }
}

