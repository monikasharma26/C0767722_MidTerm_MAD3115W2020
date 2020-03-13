//
//  String+Extension.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-13.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
/*
 Extension for String
 */
extension String {
    
    var floatValue: Float {
        return (self as NSString).floatValue
    }
    
    var isValidNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == count && count == 10
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    func toDate(withFormat format: String = "yyyy-MM-dd") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else {
            preconditionFailure("Take a look to your format")
        }
        return date
    }
}

// Extension for Float
 
extension Float {
    
    var billWithDollar: String {
        return String(format: "$%.2f", self)
    }
    
    private static var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter
    }()
    
    var delimiter: String {
        return Float.numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
