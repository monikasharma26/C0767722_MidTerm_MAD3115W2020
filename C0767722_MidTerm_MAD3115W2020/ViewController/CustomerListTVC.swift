//
//  CustomerListTVC.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-07.
//  Copyright © 2020 S@i. All rights reserved.
//


import UIKit

class CustomerListTVC: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet var contan_view: UIView!
    @IBOutlet var name_lbl: UILabel!
    @IBOutlet var email_lbl: UILabel!
    @IBOutlet var img_view: UIImageView!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // contan_view.addBorder(view: contan_view, radius: 8.0, width: 1, color: UIColor.lightGray.cgColor)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Helper
    func setDisplay(customer: CustomersVM) {
        //
        name_lbl.text = customer.fullName
        email_lbl.text = customer.email ?? ""
    }
    

}
