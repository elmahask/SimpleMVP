//
//  UserDetailsVC.swift
//  SimpleMVP
//
//  Created by Wael M Elmahask on 7/21/19.
//  Copyright © 2019 Wael M Elmahask. All rights reserved.
//

import UIKit

class UserDetailsVC: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    
    var presnter : UserDetailsVCPresnter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presnter?.viewDidLoad()
    }
}
