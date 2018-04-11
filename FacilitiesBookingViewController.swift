//
//  FacilitiesBookingViewController.swift
//  
//
//  Created by Globaltium on 30/03/2018.
//

import UIKit
import FSCalendar








class FacilitiesBookingViewController: UIViewController
{

    
    @IBOutlet weak var calendarView: FSCalendar!
    
    

    
    @IBOutlet weak var calendarHeight: NSLayoutConstraint!
    


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        calendarView.setScope(FSCalendarScope.week, animated: true)

        
        
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


