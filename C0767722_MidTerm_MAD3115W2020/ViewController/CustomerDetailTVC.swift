//
//  CustomerDetailTableViewCell.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-13.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit

class CustomerDetailTVC: UITableViewCell {

    // MARK: - Properties
        @IBOutlet var containView: UIView!
        @IBOutlet var innerView: UIView!

        @IBOutlet var type_img: UIImageView!
        @IBOutlet var day_lbl: UILabel!
        @IBOutlet var bill_lbl: UILabel!
        @IBOutlet var type_lbl: UILabel!
        @IBOutlet var upDown_img: UIImageView!
        
        @IBOutlet var desc_view: UIView!
        @IBOutlet var descp_lbl: UILabel!
        
        // MARK: -  Life Cycle
        override func awakeFromNib() {
            super.awakeFromNib()
            //
            desc_view.addShadow(view: desc_view, color: UIColor.hexStringToUIColor(hex: "6D67FD").cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.7, radius: 4)
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        
        // MARK: - Helper
        func setDisplay(bill: BillM) {
            
            //
            let type = bill.type
            switch type {
            case "INTERNET":
                type_img.image = UIImage(named: "internet1x")
               
                descp_lbl.text = "Provider: \(bill.nameIn ?? "") \nData: \(bill.dataIn ?? 0.00) GB"
            case "Mobile":
                type_img.image = UIImage(named: "mobile1x")
                
                descp_lbl.text = "Provider: \(bill.nameMo ?? "") \nPlan: \(bill.planMo ?? "") \nPhone No.: \(bill.phoneNoMo ?? "") \nData No.: \(bill.dataMo ?? 0.00) GB \nminutes: \(bill.minutesMo ?? "") mins."
            default:
                type_img.image = UIImage(named: "hydro1x")
                
                descp_lbl.text = "Provider: \(bill.nameHy ?? "") \nData: \(bill.unitsHy ?? 0.00) MW"
            }
            
            //
            type_lbl.text = type
            day_lbl.text = bill.date
            bill_lbl.text = bill.amount?.currency() ?? "$0.00"
            
        }

    }
