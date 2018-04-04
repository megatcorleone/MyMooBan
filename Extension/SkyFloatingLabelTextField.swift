//
//  SkyFloatingLabelTextField.swift
//  MyMooBan
//
//  Created by Globaltium on 28/03/2018.
//  Copyright © 2018 Megat. All rights reserved.
//


import Foundation
import SkyFloatingLabelTextField


extension SkyFloatingLabelTextField {
    
    @IBInspectable var titleUpperCase: Bool {
        get {
            return self.titleUpperCase
        }
        
        set {
            if !newValue {
                self.titleFormatter = { $0 }
            }
        }
    }
    
    @IBInspectable var titleFontSize: CGFloat {
        get {
            return self.titleLabel.font.pointSize
        }
        
        set {
            self.titleLabel.font = UIFont(name: self.titleLabel.font.fontName, size: newValue)
        }
    }
    
    @IBInspectable var titleLabelCenterAlign: Bool {
        get {
            return self.titleLabelCenterAlign
        }
        
        set {
            self.titleLabel.textAlignment = .center
            self.textAlignment = .center
            
        }
    }
    
}
