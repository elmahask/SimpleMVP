//
//  UserVCPresenter.swift
//  SimpleMVP
//
//  Created by Wael M Elmahask on 7/20/19.
//  Copyright © 2019 Wael M Elmahask. All rights reserved.
//

import Foundation
import SVProgressHUD

protocol UserVCDelegate:class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error:String)
    func navigateToDetails(user:User)
}

protocol UserCellDelegate {
    func diplayUserName(username:String)
    func diplayUserEmail(email:String)
    func diplayUserAddress(address:String)
}

class UserVCPresenter {
    private var users : User?
    private weak var userVCDelegate : UserVCDelegate?
    private let userDataProvider = UserDataProvider()
    init(userVCDelegate:UserVCDelegate){
        self.userVCDelegate = userVCDelegate
    }
    
    func viewDidLoad(){
        getUsers()
    }
    
    func getUsers(){
        self.userDataProvider.getAllUsers(completion: { [weak self] (user, error) in
            //SVProgressHUD.dismiss()
            self!.users = user
            if let error = error {
                self?.userVCDelegate?.showError(error: error.localizedDescription)
            }else{
                DispatchQueue.main.async {
                    self?.userVCDelegate?.fetchingDataSuccess()
                }
            }
        })
    }
    
    func getUsersCount() -> Int {
        return users?.count ?? 0
    }
    
    func configureCell( cell:UserCell, for indexPath:Int ) {
        let user = users![indexPath]
        cell.diplayUserName(username: user.username)
        cell.diplayUserEmail(email: user.email)
        cell.diplayUserAddress(address: "\(user.address.street), \(user.address.city)")
    }

    func didSelectRowAt(index:Int){
        let user = users![index]
        userVCDelegate?.navigateToDetails(user:[user])
        print("\(user.self)")
    }
    
}
