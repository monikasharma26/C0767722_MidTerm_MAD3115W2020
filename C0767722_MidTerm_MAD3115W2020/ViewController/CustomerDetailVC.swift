//
//  CustomerDetailVC.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-08.
//  Copyright © 2020 S@i. All rights reserved.
//
/// this is the class for showing customer detail and all the pending bill list.

import Foundation
import UIKit

class CustomerDetailVC : UIViewController {

    // MARK: - Properties
    var seleInd = -1
    
    var custmDetail: CustomersVM?
    var custDetailArrInd = Int()
    var billsList: [BillM]?
    
    @IBOutlet var customerN_lbl: UILabel!
    @IBOutlet var email_lbl: UILabel!
    @IBOutlet var total_lbl: UILabel!
    @IBOutlet var detail_view: UIView!
    
    @IBOutlet var titleDate_lbl: UILabel!
    @IBOutlet var design_lblL: UILabel!
    @IBOutlet var design_lblR: UILabel!
    
    @IBOutlet var bill_tv: UITableView!
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        initSetup()
        
        // register to receive notification...
        NotificationCenter.default.addObserver(self, selector: #selector(CustomerDetailVC.refresh), name:  Notification.Name("customerDetailVCRefresh"), object: nil)
        
    }
        
    // MARK: - Action
    @IBAction func backBtnClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addBillBtnClicked(_ sender: Any) {
        //
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddNewBillVC") as! AddNewBillVC
      //  vc.customer_id = custmDetail?.id ?? 0
        self.present(vc, animated: true, completion: nil)
      
    }

    
    func initSetup() {
        //
        custmDetail =  Singelton.intance.customerArr[custDetailArrInd]
        // 1.
        let date = Date() // save date, so all components use the same date
        // date
        let dformatter = DateFormatter()
        dformatter.dateFormat = "d MMM"
        let stDate = dformatter.string(from: date)
        
        // day
        let eformatter = DateFormatter()
        eformatter.dateFormat = "EEEE"
        let stDay = eformatter.string(from: date)
        
        titleDate_lbl.text = String(format: "%@, %@", stDay, stDate)
        customerN_lbl.text = custmDetail?.fullName
        email_lbl.text = custmDetail?.email
        
        
        billsList = custmDetail?.bills
        bill_tv.reloadData()
        
        //
        totalBills()
    }
    
    @objc func refresh() {
        //
        custmDetail =  Singelton.intance.customerArr[custDetailArrInd]
        billsList = custmDetail?.bills
        bill_tv.reloadData()
        
        //
       totalBills()
    }
    
    func totalBills() {
        //
        var sum = Float()
        if let bills = custmDetail?.bills {
            for bill in bills {
                sum += bill.amount ?? 0.00
                print("Sum is : \(sum)")
            }
        }
        
        //
        total_lbl.text = sum.currency()
       
    }
    
}

// MARK:- UITableViewDataSource
extension CustomerDetailVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return billsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerDetailTVC", for: indexPath ) as! CustomerDetailTVC

        //
        cell.setDisplay(bill: (billsList?[indexPath.row])!)
        
        //
        cell.desc_view.isHidden = true
        cell.upDown_img.image = UIImage(named: "down1x")
        if(seleInd == indexPath.row){
            cell.desc_view.isHidden = false
            cell.upDown_img.image = UIImage(named: "up1x")
            
        }
        
        return cell
    }
    
}

// MARK:- UITableViewDelegate
extension CustomerDetailVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        if(seleInd == indexPath.row){
            return UITableView.automaticDimension//tableView.automatic
        }
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        tableView.deselectRow(at: indexPath, animated: true)
                
        let prevSlInd = seleInd
        seleInd = indexPath.row
        let indexPath = IndexPath(item: seleInd, section: 0)
        tableView.reloadRows(at: [indexPath], with: .none)
        
        if(prevSlInd >= 0){
            let indexPath = IndexPath(item: prevSlInd, section: 0)
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
   
}



