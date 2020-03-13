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
        setupUI()
        
        //
        initSetup()
        
        // register to receive notification...
        NotificationCenter.default.addObserver(self, selector: #selector(CustomerDetailVC.refresh), name:  Notification.Name("customerDetailVCRefresh"), object: nil)
        
    }
        
    // MARK: - Action
    @IBAction func backBtnClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
  /*  @IBAction func addBillBtnClicked(_ sender: Any) {
        //
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddNewBillVC") as! AddNewBillVC
        vc.cus = custmDetail?.id ?? 0
        self.present(vc, animated: true, completion: nil)
      
    }*/
    
    // MARK: - SetupUISS
    func setupUI() {
        design_lblL.roundCorners(corners: [.bottomRight, .topRight], radius: 8.0)
        design_lblR.roundCorners(corners: [.bottomLeft, .topLeft], radius: 8.0)
        
        //
        detail_view.addShadow(view: detail_view, color: UIColor.hexStringToUIColor(hex: "6D67FD").cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.7, radius: 8)
        design_lblL.addShadow(view: design_lblL, color: UIColor.gray.cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.7, radius: 8)
        design_lblR.addShadow(view: design_lblR, color: UIColor.gray.cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.7, radius: 8)
        
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
        calcInsurance()
    }
    
    @objc func refresh() {
        //
        custmDetail =  Singelton.intance.customerArr[custDetailArrInd]
        billsList = custmDetail?.bills
        bill_tv.reloadData()
        
        //
        calcInsurance()
    }
    
    func calcInsurance() {
        //
        var sum = Float()
        if let bills = custmDetail?.bills {
            for bill in bills {
                sum += bill.amount ?? 0.00
            }
        }
        total_lbl.text = sum.currency()
       
    }
    
}


