//
//  FabButton.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 14/03/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

class FabButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 0.5
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
