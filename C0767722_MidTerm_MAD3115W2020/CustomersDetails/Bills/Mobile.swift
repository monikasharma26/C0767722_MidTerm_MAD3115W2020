//
//  Mobile.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-13.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
class Mobile: Bill{
    internal var manufacturerName: String?
       internal var planName: String?
       internal var mobileNumber: String?
       private var internetGBUsed: Int?
       private var minutesUsed: Int?
       
       init(billId: Int?, billDate: String?, billType: BillType?, billAmount: Float?, manufacturerName: String?, planName: String?, mobileNumber: String?, internetGBUsed: Int?, minutesUsed: Int?) {
           super.init(billId: billId, billDate: billDate, billType: billType, billAmount: billAmount)
           self.manufacturerName = manufacturerName
           self.planName = planName
           self.mobileNumber = mobileNumber
           self.internetGBUsed = internetGBUsed
           self.minutesUsed = minutesUsed
       }
       
}
