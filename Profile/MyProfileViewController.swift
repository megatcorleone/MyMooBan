//
//  MyProfileViewController.swift
//  MyMooBan
//
//  Created by Globaltium on 12/04/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var emailUser: UILabel!
    
    
    
    



    override func viewDidLoad() {
        super.viewDidLoad()

        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 1.0
        //profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.white.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    

   



}
