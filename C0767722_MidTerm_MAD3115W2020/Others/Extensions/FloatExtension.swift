//
//  FloatExtension.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-13.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
//Mark: - Link I used /
// https://stackoverflow.com/questions/41558832/how-to-format-a-double-into-currency-swift-3
extension Float {
    func currency() -> String
    {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        let formatmount = formatter.string(from: self as NSNumber)
        let result = String(format: "%@", formatmount!)
        return result
    }
    
    // used to set as Units Usage.
    func unitsUsage() -> String
    {
        let result = String(format: "%.2f MW", self)
        return result
    }
}

