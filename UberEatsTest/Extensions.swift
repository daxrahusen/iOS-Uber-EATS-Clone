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

extension UILabel {
    
    func setLineHeight(lineHeight: CGFloat) {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.0
        paragraphStyle.lineHeightMultiple = lineHeight
        paragraphStyle.alignment = self.textAlignment
        
        let attrString = NSMutableAttributedString(string: self.text!)
        attrString.addAttribute(NSFontAttributeName, value: self.font, range: NSMakeRange(0, attrString.length))
        attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        
        self.attributedText = attrString
    }
}



