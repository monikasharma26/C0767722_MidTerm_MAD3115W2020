//
//  CustomersVM.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-07.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit
import Foundation

class CustomersVM: NSObject {

// MARK: - Properties
    var id: Int?
    var firstName: String?
    var lastName: String?
    var email: String?

    /// this is used to concat fisrt name and last name
    var calFull: String {
        get {
              return (firstName ?? "") + " " + (lastName ?? "")
           }
    }
    
    // MARK: - Life Cycle
    init(customer: CustomersM){
        self.id = customer.id
        self.firstName = customer.firstName
        self.lastName = customer.lastName
        self.email = customer.email
    }
    
}

