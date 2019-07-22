//
//  UserVc+TableView.swift
//  SimpleMVP
//
//  Created by Wael M Elmahask on 7/20/19.
//  Copyright © 2019 Wael M Elmahask. All rights reserved.
//

import UIKit

extension UserVC : UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getUsersCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        presenter?.configureCell(cell: cell, for: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(index: indexPath.row)
    }
    
}
