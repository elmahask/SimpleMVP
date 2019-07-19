//
//  ContactPresenter.swift
//  SimpleMVP
//
//  Created by Wael M Elmahask on 7/19/19.
//  Copyright © 2019 Wael M Elmahask. All rights reserved.
//

import Foundation

//update view
protocol ContactViewDelegate: NSObjectProtocol {
    func displayContactDetails(phoneNumber:String)
    func displayContactList(userList:[User])
}

class ContactPresenter {
    
    private var providerDataService : ProviderDataService
    
    private weak var contactViewDelegate : ContactViewDelegate?
    
    init( providerDataService : ProviderDataService ){
        self.providerDataService = providerDataService
    }
    
    func setViewDelegate( contactViewDelegate : ContactViewDelegate? ){
        self.contactViewDelegate = contactViewDelegate
    }
    
    func userNameSelected( userName : String ){
        providerDataService.getContactDetails(userName: userName) { [weak self] (user) in
            if let userSelected = user {
                self?.contactViewDelegate?.displayContactDetails(phoneNumber: "\(userSelected.userName) has "+"\(userSelected.phoneNumber)")
            }
        }
        
    }
    
    func userList(){
        providerDataService.getContactList { [unowned self](userList) in
            print("presenter \(userList?.count ?? 0)")
            if let userList = userList {
                print("presenter inside \(userList.count)")
                self.contactViewDelegate?.displayContactList(userList: userList)
            }
        }
    }
    
}
