//
//  Bill.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-13.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
enum Type: String {
        case internet = "Internet", mobile = "Mobile", hydro = "Hydro", insurance = "Insurance"
    }

    class Bill {
        
        private var billId: Int?
        private var billDate: String?
        internal var billType: BillType?
        private var billAmount: Float?
        
        var getBillId: Int {
            get {
                return billId ?? 0
            }
        }
        
        var getBillDate: String {
            get {
                return billDate ?? ""
            }
        }
        
        var getBillAmount: Float {
            get {
                return billAmount ?? 0
            }
        }
        
        init(billId: Int?, billDate: String?, billType: BillType?, billAmount: Float?) {
            self.billId = billId
            self.billDate = billDate
            self.billType = billType
            self.billAmount = billAmount
        }
        
       
    }


