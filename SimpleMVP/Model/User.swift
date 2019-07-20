//
//  File.swift
//  SimpleMVP
//
//  Created by Wael M Elmahask on 7/19/19.
//  Copyright © 2019 Wael M Elmahask. All rights reserved.
//
//  https://jsonplaceholder.typicode.com/users
import Foundation

typealias User = [UserElement]
// MARK: - UserElement
class UserElement: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
    
    init(id: Int, name: String, username: String, email: String, address: Address, phone: String, website: String, company: Company) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.phone = phone
        self.website = website
        self.company = company
    }
}
