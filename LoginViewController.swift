//
//  LoginViewController.swift
//  MyMooBan
//
//  Created by Globaltium on 26/03/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit
import os.log

class LoginViewController: UIViewController {
    
    
    //Properties
    
    
    @IBOutlet weak var emailUser: DesignableUITextField!
    
    @IBOutlet weak var userPassword: DesignableUITextField!
    
    @IBOutlet weak var forgotPassword: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var newUser: UILabel!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    

    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        

        


        

        // Do any additional setup after loading the view.
    }
    


    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
