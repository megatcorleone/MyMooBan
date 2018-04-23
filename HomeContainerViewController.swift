//
//  HomeContainerViewController.swift
//  MyMooBan
//
//  Created by Globaltium on 29/03/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit



class HomeContainerViewController: UIViewController{
    
    
    
    @IBAction func sosCall(_ sender: UIButton) {
        let url : NSURL = URL(string: "TEL://+60175802599")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        print("good")
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    

}
