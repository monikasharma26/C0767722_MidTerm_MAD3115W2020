//
//  Hydro.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-13.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
class Hydro: Bill{
    internal var agencyName: String?
       private var unitsConsumed: Int?
       
       var unitsConsumption: String {
           if let unitsConsumed = unitsConsumed?.billWithUnits {
               return unitsConsumed
           }
           return "No Units used"
       }
       
       init(billId: Int?, billDate: String?, billType: BillType?, billAmount: Float?, agencyName: String?, unitsConsumed: Int?) {
           super.init(billId: billId, billDate: billDate, billType: billType, billAmount: billAmount)
           self.agencyName = agencyName
           self.unitsConsumed = unitsConsumed
       }
       
}
