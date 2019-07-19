//
//  ContactViewController.swift
//  SimpleMVP
//
//  Created by Wael M Elmahask on 7/19/19.
//  Copyright © 2019 Wael M Elmahask. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ContactViewDelegate {
   
    @IBOutlet weak var diplayLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    private let contactPresenter = ContactPresenter(providerDataService: ProviderDataService())
    private var userList = [User]()
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        contactPresenter.setViewDelegate(contactViewDelegate: self)
        contactPresenter.userList()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.userList[indexPath.row].userName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contactPresenter.userNameSelected(userName: userList[indexPath.row].userName)
    }
    
    func displayContactList(userList: [User]) {
        print("view \(userList.count)")
        self.userList = userList
        tableView.reloadData()
    }
    
    func displayContactDetails(phoneNumber: String) {
        print(phoneNumber)
        self.diplayLabel.text = phoneNumber
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
