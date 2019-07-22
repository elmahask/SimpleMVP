//
//  UserVCPresenter.swift
//  SimpleMVP
//
//  Created by Wael M Elmahask on 7/20/19.
//  Copyright © 2019 Wael M Elmahask. All rights reserved.
//

import Foundation
import SVProgressHUD

protocol UserViewDelegate:class {
    var presenter : UserVCPresenter? { get set }
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error:String)
}

protocol UserCellViewDelegate {
    func diplayUserName(username:String)
    func diplayUserEmail(email:String)
    func diplayUserAddress(address:String)
}

class UserVCPresenter {
    private var users : User?
    private weak var view : UserViewDelegate?
    private var interactor : UserInteractor
    private let router : UserVCRouter
    
    init(view:UserViewDelegate?, interactor:UserInteractor, router:UserVCRouter){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad(){
        getUsers()
    }
    
    func getUsers(){
        self.interactor.getAllUsers(completion: { [weak self] (user, error) in
            //SVProgressHUD.dismiss()
            self!.users = user
            if let error = error {
                self?.view?.showError(error: error.localizedDescription)
            }else{
                DispatchQueue.main.async {
                    self?.view?.fetchingDataSuccess()
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
        print("dddddd \(user.address)")
        router.navigateToDetails(from:view, user: user)
    }
    
}
