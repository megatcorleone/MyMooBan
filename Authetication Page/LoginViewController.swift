//
//  LoginViewController.swift
//  MyMooBan
//
//  Created by Globaltium on 26/03/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit
import os.log
import PopupDialog


class LoginViewController: UIViewController {
    
    
    //Properties
    
    
    @IBOutlet weak var emailUser: DesignableUITextField!
    
    @IBOutlet weak var userPassword: DesignableUITextField!
    
    @IBAction func forgotPassword(_ sender: UIButton) {
        
        showCustomDialog()
    }
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var newUser: UILabel!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    

    
    


    override func viewDidLoad() {
        super.viewDidLoad()


    }
    


    
    func showCustomDialog(animated: Bool = true) {
        
        // Create a custom view controller
        let ratingVC = ForgotPasswordViewController(nibName: "ForgotPassword", bundle: nil)
        
        // Create the dialog
        let popup = PopupDialog(viewController: ratingVC, buttonAlignment: .horizontal, transitionStyle: .zoomIn, gestureDismissal: true)
        
        
        // Present dialog
        present(popup, animated: animated, completion: nil)
    }
    

    
    

   
}
