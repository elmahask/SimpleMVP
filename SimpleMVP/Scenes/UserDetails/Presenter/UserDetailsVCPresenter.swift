//
//  UserDetailsVCPresenter.swift
//  SimpleMVP
//
//  Created by Wael M Elmahask on 7/21/19.
//  Copyright © 2019 Wael M Elmahask. All rights reserved.
//

import Foundation

//protocol UserDetailsViewDelegate : class {
//    var presenter : UserDetailsVCPresenter? { get set }
//    func showIndicator()
//    func hideIndicator()
//    func fetchingDataSuccess()
//    func showError(error:String)
//}

protocol UserDetailsViewDelegate : class {
    var presnter : UserDetailsVCPresnter? {get set}
    func diplayUserName(username:String)
    func diplayUserEmail(email:String)
    func diplayUserAddress(address:String)
    func diplayUserPhone(phone:String)
    func diplayUserCompany(company:String)
}


class UserDetailsVCPresnter {
    private weak var view : UserDetailsViewDelegate?
    //private let router : UserDetailsVCRouter
    private let user:UserElement
    
    init(view:UserDetailsViewDelegate?, user:UserElement){
        self.view = view
        //self.router = router
        self.user = user
    }
    
    func viewDidLoad() {
        view?.diplayUserName(username: user.username)
        view?.diplayUserEmail(email: user.email)
        view?.diplayUserAddress(address: "\(user.address.street) \(user.address.city)")
        view?.diplayUserPhone(phone: user.phone)
        view?.diplayUserCompany(company:user.company.name)
    }

}
