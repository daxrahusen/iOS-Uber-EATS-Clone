//
//  Extensions.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 13/03/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

extension UIView {
    
    func addGradient() {
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.frame
        gradient.colors = [UIColor.black.withAlphaComponent(0.6).cgColor, UIColor.clear.cgColor]
        gradient.locations = [0.0, 0.2]
        
        self.layer.insertSublayer(gradient, at: 1)
    }
}

