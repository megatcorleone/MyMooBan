//
//  ForgotPasswordViewController.swift
//  MyMooBan
//
//  Created by Globaltium on 19/04/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit
import PopupDialog
import SkyFloatingLabelTextField

class ForgotPasswordViewController: UIViewController {
    
    

    @IBOutlet weak var emailUser: SkyFloatingLabelTextField!
    
    
    @IBAction func submitButton(_ sender: UIButton) {
        
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //emailUser.delegate = self

        
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
    }

//    @objc func endEditing() {
//        view.endEditing(true)
//    }
    
}

//extension ForgotPasswordViewController: UITextFieldDelegate {
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        endEditing()
//        return true
//}
//}

