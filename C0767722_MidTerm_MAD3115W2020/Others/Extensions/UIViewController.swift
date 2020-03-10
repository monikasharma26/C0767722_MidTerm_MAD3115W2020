//
//  UIViewController.swift
//  C0767722_MidTerm_MAD3115W2020
//
//  Created by S@i on 2020-03-07.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {

    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
 
    func navigateScreen(storyboard: String, controller: String) {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: controller)
        self.navigationController?.pushViewController(vc, animated: true)
    }


}
