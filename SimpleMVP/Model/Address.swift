//
//  Address.swift
//  SimpleMVP
//
//  Created by Wael M Elmahask on 7/20/19.
//  Copyright © 2019 Wael M Elmahask. All rights reserved.
//

import Foundation

// MARK: - Address
class Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
    
    init(street: String, suite: String, city: String, zipcode: String, geo: Geo) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = geo
    }
}

// MARK: - Geo
class Geo: Codable {
    let lat, lng: String
    
    init(lat: String, lng: String) {
        self.lat = lat
        self.lng = lng
    }
}
