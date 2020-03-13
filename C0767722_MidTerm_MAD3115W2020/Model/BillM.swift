//
//  BillM.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-13.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation

enum BillType: String, CaseIterable {
    case internet = "INTERNET", mobile = "MOBILE", hydro = "HYDRO", insurance = "INSURANCE"
}

struct BillM: Codable {
    
    // MARK: - Properties
    var id: String?
    var date: String?
    var type: String?
    var amount: Float?
    
    // Internet Properties
    var nameIn: String?
    var dataIn: Float?
    
    // Mobile Properties
    var nameMo: String?
    var planMo: String?
    var phoneNoMo: String?
    var dataMo: Float?
    var minutesMo: String?

    // Hydro Properties
    var nameHy: String?
    var unitsHy: Float?
    
}
