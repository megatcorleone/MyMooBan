//
//  SignUpViewController.swift
//  MyMooBan
//
//  Created by Globaltium on 28/03/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit
import M13Checkbox
import SkyFloatingLabelTextField


class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var nameUser: SkyFloatingLabelTextField!
    
    @IBOutlet weak var emailUser: SkyFloatingLabelTextField!

    @IBOutlet weak var contactNo: SkyFloatingLabelTextField!
    
    @IBOutlet weak var provinceUser: SkyFloatingLabelTextField!
    
    @IBOutlet weak var districtUser: SkyFloatingLabelTextField!
    
    @IBOutlet weak var subDistrict: SkyFloatingLabelTextField!
    
    @IBOutlet weak var mooBan: SkyFloatingLabelTextField!
    
    @IBOutlet weak var unitNo: SkyFloatingLabelTextField!
    
    @IBOutlet weak var passwordUser: SkyFloatingLabelTextField!
    
    @IBOutlet weak var confirmPassword: SkyFloatingLabelTextField!
    
    @IBOutlet weak var checkBox: M13Checkbox!
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //checkbox
        checkBox.stateChangeAnimation = .expand(.stroke)
    
        




    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
