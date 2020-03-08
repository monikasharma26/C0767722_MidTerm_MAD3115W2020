//
//  CustomerListVC.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-07.
//  Copyright © 2020 S@i. All rights reserved.
//
import UIKit
class CustomerListVC: UIViewController {

    // MARK:- Properties
    @IBOutlet var top_view: UIView!
    @IBOutlet var custmList_tv: UITableView!
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        setUpUI()
        //
        initSetup()
        // register to receive notification...
        NotificationCenter.default.addObserver(self, selector: #selector(CustomerListVC.refresh), name:  Notification.Name("customerListRefresh"), object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK:- Action
    @IBAction func signoutBtnClicked(_ sender: Any) {
        //
        let alertController = UIAlertController(title: "", message: "Do You want to Sign Out?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive) {
            UIAlertAction in
            
            //
            self.navigationController?.popToRootViewController(animated: true)
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
       
    }
    
    @IBAction func addBtnClicked(_ sender: Any) {
        //
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddCustomerVC")
        self.present(vc, animated: true, completion: nil)
    }
    
    // MARK: - Helper
    func initSetup(){
        //
        refresh()
        Singelton.intance.populateCustomer()
        
    }
    
    func setUpUI() {
        //
        top_view.addShadow(view: top_view, color: UIColor.hexStringToUIColor(hex: "6D67FD").cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.5, radius: 5)
        
    }
    
    @objc func refresh() {
        //
        custmList_tv.reloadData()
    }
    
}


