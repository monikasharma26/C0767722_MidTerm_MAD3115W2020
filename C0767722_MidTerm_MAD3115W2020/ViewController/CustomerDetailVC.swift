//
//  CustomerDetailVC.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-08.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit

/// this is the class for showing customer detail and all the pending bill list.
class CustomerDetailVC: UIViewController {

    // MARK: - Properties
    var seleInd = -1
    
    var customerDetail: CustomersVM?
    var custDetailArr = Int()
    
    @IBOutlet var customerN_lbl: UILabel!
    @IBOutlet var email_lbl: UILabel!
    @IBOutlet var detail_view: UIView!
    @IBOutlet var titleDate_lbl: UILabel!

    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        initSetup()
        
        
    }
        
    // MARK: - Action
    @IBAction func backBtnClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func initSetup() {
        customerDetail =  Singelton.intance.customerArr[custDetailArr]
        let date = Date()
        let dformatter = DateFormatter()
        dformatter.dateFormat = "d MMM"
        let stDate = dformatter.string(from: date)
        let eformatter = DateFormatter()
        eformatter.dateFormat = "EEEE"
        let stDay = eformatter.string(from: date)
        titleDate_lbl.text = String(format: "%@, %@", stDay, stDate)
        customerN_lbl.text = customerDetail?.fullName
        email_lbl.text = customerDetail?.email
    }
    
   
    
}


