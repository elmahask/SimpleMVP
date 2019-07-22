//
//  UserVC.swift
//  SimpleMVP
//
//  Created by Wael M Elmahask on 7/20/19.
//  Copyright © 2019 Wael M Elmahask. All rights reserved.
//

import UIKit

class UserVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var presenter : UserVCPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        //presenter = UserVCPresenter(view: self)
        setupTableView()
        presenter?.viewDidLoad()
    }
}
