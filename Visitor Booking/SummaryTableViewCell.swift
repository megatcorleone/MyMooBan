//
//  SummaryTableViewCell.swift
//  MyMooBan
//
//  Created by Globaltium on 12/04/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit

class SummaryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var visitorName: UILabel!
    
    @IBOutlet weak var dateVisit: UILabel!
    
    @IBOutlet weak var timeVisit: UILabel!
    
    @IBOutlet weak var imageCode: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
