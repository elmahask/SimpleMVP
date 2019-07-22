//
//  UserDetailsVC+PresenterDelegate.swift
//  SimpleMVP
//
//  Created by Wael M Elmahask on 7/21/19.
//  Copyright © 2019 Wael M Elmahask. All rights reserved.
//

import Foundation

extension UserDetailsVC : UserDetailsViewDelegate {

    func diplayUserName(username: String) {
        print("items: Any...\(username)")
        userNameTextField.text = username
    }
    
    func diplayUserEmail(email: String) {
        emailTextField.text = email
    }
    
    func diplayUserAddress(address: String) {
        addressTextField.text = address
    }
    
    func diplayUserPhone(phone: String) {
        phoneTextField.text = phone
    }
    
    func diplayUserCompany(company: String) {
        companyTextField.text = company
    }
    
    
}
