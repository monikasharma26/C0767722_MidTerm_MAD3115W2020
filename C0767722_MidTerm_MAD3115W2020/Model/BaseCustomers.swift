//
//  BaseCustomers.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-07.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation

struct BaseCustomers: Codable {
    
    var cust: [CustomersM]?
    
    enum CodingKeys: String, CodingKey {
        case cust = "Customer"
    }
}
