//
//  AddCustomerVC.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-07.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit

   /// This is the class to add new customer
   class AddCustomerVC: UIViewController {

       // MARK: - Properties
       @IBOutlet var contan_view: UIView!
       @IBOutlet var fNameInn_view: UIView!
       @IBOutlet var lNameInn_view: UIView!
       @IBOutlet var emailInn_view: UIView!
       
       @IBOutlet var fName_tf: UITextField!
       @IBOutlet var lName_tf: UITextField!
       @IBOutlet var email_tf: UITextField!
       
       @IBOutlet var cancelBtn: UIButton!
       
       // MARK:- Life Cycle
       override func viewDidLoad() {
           super.viewDidLoad()
       }
       // MARK: - Action
       @IBAction func cancelBtnClicked(_ sender: Any) {
           //
           self.dismiss(animated: true, completion: nil)
       }
       
       @IBAction func doneBtnClicked(_ sender: Any) {
           // check validation
           if self.checkTextFields() {

               //
               let boolChk = self.emailAlready().0
               let newId = self.emailAlready().1
               if boolChk {
                   //
                   let newCustomer = CustomersM(id: (newId + 1), firstName: fName_tf.text, lastName: lName_tf.text, email: email_tf.text)
                   
                   Singelton.intance.customerArr.append(CustomersVM(customer: newCustomer))
                   
                   NotificationCenter.default.post(name: Notification.Name("customerListRefresh"), object: nil)
                   customerAdd()
                  
               }else{
                   self.showAlert(title: "", message: "E-mail address already used")
               }
           }
       }

       // MARK: - Helper
       func customerAdd() {
           //
           let alertController = UIAlertController(title: "Success", message: "Customer Created Successfully.", preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive) {
               UIAlertAction in
                self.dismiss(animated: true, completion: nil)
           }
           
           // Add the actions
           alertController.addAction(okAction)
           
           // Present the controller
           self.present(alertController, animated: true, completion: nil)
       }
    
       //
       func checkTextFields() -> Bool {
           //
           if fName_tf.text == "" {
               self.showAlert(title: "", message: "First Name is required.")
               return false
           }
           if lName_tf.text == "" {
               self.showAlert(title: "", message: "Last Name is required.")
               return false
           }
           if email_tf.text == "" {
               self.showAlert(title: "", message: "E-mail address is required.")
               return false
           }
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,10}"
           let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
           if emailTest.evaluate(with: email_tf.text) == false {
               self.showAlert(title: "", message: "Please Enter Valid Email Address!")
               return false
           }
           
           return true
       }
       
       //
       func emailAlready() -> (Bool, Int) {
           var id = Int()
           
           let custArr = Singelton.intance.customerArr
           // check if email exists or not...
           for customer in custArr {
               if email_tf.text == customer.email {
                   return (false, 0)
               }
               
               id = customer.id ?? 0
           }
           
           return (true, id)
       }
       
      
   }


