//
//  Internet.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-13.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
class Internet: Bill {

internal var providerName: String?
private var internetGBUsed: Int?

var internetUsed: String {
    if let internetGBUsed = internetGBUsed {
        return internetGBUsed.billWithGB
    }
    return "No Internet used"
}

init(billId: Int?, billDate: String?, billType: BillType?, billAmount: Float?, providerName: String?, internetGBUsed: Int?) {
    super.init(billId: billId, billDate: billDate, billType: billType, billAmount: billAmount)
    self.providerName = providerName
    self.internetGBUsed = internetGBUsed
}
}
