//
//  Singelton.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-07.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
class Singelton {
    
    static let intance = Singelton()
    private init(){}
    var customerArr = [CustomersVM]()
    
    func populateCustomer() {
        // fetching data from json...
        let customers = DataSource.readJsonWith(name: "Customer")
        Singelton.intance.customerArr.removeAll()
        for custmer in customers {
            Singelton.intance.customerArr.append(CustomersVM(customer: custmer))
        }
        
    }
    
}
