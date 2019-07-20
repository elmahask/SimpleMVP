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
    var userPresenter : UserVCPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        userPresenter = UserVCPresenter(userVCDelegate: self)
        setupTableView()
        userPresenter.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
