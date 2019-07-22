//
//  UserVC+PresenterDelegate.swift
//  SimpleMVP
//
//  Created by Wael M Elmahask on 7/20/19.
//  Copyright © 2019 Wael M Elmahask. All rights reserved.
//

import Foundation
import SVProgressHUD

extension UserVC : UserViewDelegate {
 
    func showIndicator() {
        //SVProgressHUD.show()
    }
    
    func hideIndicator() {
        //SVProgressHUD.dismiss()
    }
    
    func fetchingDataSuccess() {
        tableView.reloadData()
    }
    
    func showError(error: String) {
        //SVProgressHUD.showError(withStatus: error)
    } 
}
