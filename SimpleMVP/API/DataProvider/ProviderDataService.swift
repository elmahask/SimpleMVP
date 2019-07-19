//
//  Data.swift
//  SimpleMVP
//
//  Created by Wael M Elmahask on 7/19/19.
//  Copyright © 2019 Wael M Elmahask. All rights reserved.
//

import Foundation
class ProviderDataService {
    func getContactDetails(userName:String, callBack:(User?) -> Void) {
        let userList = [
            User(userName: "wael", phoneNumber: "01095486221"),
            User(userName: "Mohamed", phoneNumber: "01212301662"),
            User(userName: "Ahmed", phoneNumber: "01115142054")]
        
        if let fetch = userList.first(where: {$0.userName == userName}) {
            callBack(fetch)
        } else {
            callBack(nil)
        }
    }
    
    func getContactList(callBack:([User]?) -> Void) {
        let userList = [
            User(userName: "wael", phoneNumber: "01095486221"),
            User(userName: "Mohamed", phoneNumber: "01212301662"),
            User(userName: "Ahmed", phoneNumber: "01115142054")]
        
        if userList.count > 0 {
            callBack(userList)
        }else{
            callBack(nil)
        }
    }
}
