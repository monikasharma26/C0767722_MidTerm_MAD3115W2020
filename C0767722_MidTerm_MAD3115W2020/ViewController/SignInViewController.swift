//
//  ViewController.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-04.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    // MARK: - Properties
       @IBOutlet var Signinview: UIView!
       @IBOutlet var Textfiledview: UIView!
       @IBOutlet var userview: UIView!
       @IBOutlet var passwordview: UIView!
       @IBOutlet var remembBtn: UIButton!
       @IBOutlet var signInBtn: UIButton!
       @IBOutlet var usertxt: UITextField!
       @IBOutlet var passwordtxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //
        self.view.endEditing(true)
        
        //
        initSetup()
    }
    
    // MARK: - Action
    @IBAction func userHintBtnClicked(_ sender: Any) {
        self.showAlert(title: "User Name Hint :", message: "Enter UserName")
    }
   
    
    @IBAction func passwdHintBtnClicked(_ sender: Any) {
        self.showAlert(title: "Password Hint:", message: "Enter Password")
    }
    
    @IBAction func rememberBtnClicked(_ sender: UIButton) {
        if sender.isSelected == false {
            sender.isSelected = true
        }else{
            sender.isSelected = false
        }
    }
    
    @IBAction func signInBtnClicked(_ sender: Any) {
        //
        if remembBtn.isSelected == true {
            
            UserDefaults.standard.set(usertxt.text, forKey: "user_name")
            UserDefaults.standard.set(passwordtxt.text, forKey: "password")
        }else{
            if let appDomain = Bundle.main.bundleIdentifier {
                UserDefaults.standard.removePersistentDomain(forName: appDomain)
             }
        }
        
        // check validation
        if self.checkTextFields() {
            
            let boolChk = self.readDataInfoFromPlistFile().0
            let msg = self.readDataInfoFromPlistFile().1
            if boolChk {
                //
                self.navigateScreen(storyboard: "Home", controller: "CustomerListVC")
            }else{
                self.showAlert(title: "", message: msg)
            }
        }
        
    }
    
    // MARK: - Helper
    func initSetup(){
        //
        if let userName = UserDefaults.standard.string(forKey: "user_name"), let passwd = UserDefaults.standard.string(forKey: "password") {
            //
            remembBtn.isSelected = true
            usertxt.text = userName
            passwordtxt.text = passwd
        }else{
            // reset values
            usertxt.text = ""
            passwordtxt.text = ""
        }
    }
    
    func checkTextFields() -> Bool {
        
        if usertxt.text == "" {
            self.showAlert(title: "UserName", message: "Username is required.")
            return false
        }
        if passwordtxt.text == "" {
            self.showAlert(title: "Password", message: "Password is required.")
            return false
        }
        
        return true
    }
    
    func readDataInfoFromPlistFile() -> (Bool, String) {
        
        if let plist = Bundle.main.path(forResource: "DataInfo", ofType: "plist")
           {
               if let dict = NSDictionary(contentsOfFile: plist)
               {
                   //Reading the users
                   if let users = dict["appUsers"] as? [[String: String]]
                   {
                        var strMsg = String()
                        for user in users
                        {
                           
                            let userName = user["username"]!
                            let passwd = user["password"]!
                            
                            // match entered data
                            if(userName != usertxt.text){
                                strMsg = "Wrong Username"
                            }else if(userName == usertxt.text && passwd != passwordtxt.text){
                                strMsg = "Wrong Password"
                            }else if(userName == usertxt.text && passwd == passwordtxt.text) {
                                strMsg = ""
                                return (true, "")
                            }
                        }
                    
                        //
                        return (false, strMsg)
                   }
                  
               }
           }
        
           return (false, "Invalid information, check again.")
           
    }
    //Marks: -  Setup UI controllers
    func setUpUI() {
        //
        Signinview.addBorder(view: Signinview, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
        Textfiledview.addBorder(view: Textfiledview, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
        signInBtn.addBorder(view: signInBtn, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
        //
        Signinview.addShadow(view: Signinview, color: UIColor.hexStringToUIColor(hex: "6D67FD").cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.8, radius: 5)
        Textfiledview.addShadow(view: Textfiledview, color: UIColor.lightGray.cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.4, radius: 5)
        signInBtn.addShadow(view: signInBtn, color: UIColor.hexStringToUIColor(hex: "6D67FD").cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.8, radius: 5)
        
    }
    
}

