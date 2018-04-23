//
//  ResponseData.swift
//  MyProjectTemplate
//
//  Created by sobonus on 24/11/2017.
//  Copyright © 2017 ionnex. All rights reserved.
//

import Foundation
import JSONParserSwift

class ResponseData: ParsableModel{
    
    
    var success: String?
    var access_token: String?
    var data: [CountryData]?
    
}
