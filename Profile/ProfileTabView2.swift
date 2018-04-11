//
//  ProfileTabView2.swift
//  MyMooBan
//
//  Created by Globaltium on 11/04/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ProfileTabView2: UIViewController, IndicatorInfoProvider {

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Pending Approval")
    }
    



}
