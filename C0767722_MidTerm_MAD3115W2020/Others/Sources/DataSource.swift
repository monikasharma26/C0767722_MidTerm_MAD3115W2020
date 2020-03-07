//
//  DataSource.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-07.
//  Copyright © 2020 S@i. All rights reserved.
//
/// This is the class to fetch data from json file

import Foundation
class DataSource {
    
    // MARK:- Life Cycle
    //
    private init(){ }
    
    // MARK:- Functions
    /** parsing method 1
     */
    static func readJsonWith(name file: String) -> [CustomersM] {
        let url = Bundle.main.url(forResource: file, withExtension: "json")
        guard let jsonData = url else{ return [] }
        guard let data = try? Data(contentsOf: jsonData) else { return [] }
        do {
            let decoder = JSONDecoder()
            let baseModel = try decoder.decode(BaseCustomers.self, from: data)
            guard let customers = baseModel.cust else { return [] }
            return customers
        } catch let err {
            debugPrint(err)
            return []
        }
    }
    
}
