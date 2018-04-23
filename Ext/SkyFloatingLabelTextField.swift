//
//  SkyFloatingLabelTextField.swift
//  MyMooBan
//
//  Created by Globaltium on 28/03/2018.
//  Copyright © 2018 Megat. All rights reserved.
//


import Foundation
import UIKit
import SkyFloatingLabelTextField


extension SkyFloatingLabelTextField {
    
    @IBInspectable override var borderColor: UIColor? {
        
        get {
            
            return UIColor(cgColor: layer.borderColor!) }
        set {
            
            layer.borderColor = newValue?.cgColor }
        
        
    }
    
    
    
    
    
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
    
    
    @IBInspectable override var leftBorderWidth: CGFloat {
        
        get {
            
            return 0.0
        // Just to satisfy property
        
        }
        
        set {
            
            let line = UIView(frame: CGRect(x: 0.0, y: 0.0, width: newValue, height: bounds.height))
            
            line.translatesAutoresizingMaskIntoConstraints = false
            
            line.backgroundColor = UIColor(cgColor: layer.borderColor!)
            
            self.addSubview(line)
            
            let views = ["line": line]
            
            let metrics = ["lineWidth": newValue]
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[line(==lineWidth)]", options: [], metrics: metrics, views: views))
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[line]|", options: [], metrics: nil, views: views)) }
        
    }
    
    
    
    @IBInspectable override var bottomBorderWidth: CGFloat {
        
        get {
            return 0.0
            // Just to satisfy property
            
        }
        
        set {
            let line = UIView(frame: CGRect(x: 0.0, y: bounds.height, width: bounds.width, height: newValue))
            
            line.translatesAutoresizingMaskIntoConstraints = false
            
            line.backgroundColor = borderColor
            
            self.addSubview(line)
            
            let views = ["line": line]
            
            let metrics = ["lineWidth": newValue]
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[line]|", options: [], metrics: nil, views: views))
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[line(==lineWidth)]|", options: [], metrics: metrics, views: views))
            
        }
        
    }

    
}



