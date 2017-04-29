//
//  RadioButton.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 21/04/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

protocol RadioButtonDelegate: class {
    func didClickRadioButtonWith(int: Int, and state: Bool)
}

class RadioButton: UIButton {
    
    lazy var selectedView: UIButton = {
        let v = UIButton(type: .system)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(red: 92/255.0, green: 197/255.0, blue: 94/255.0, alpha: 1)
        v.layer.cornerRadius = 15
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor(red: 92/255.0, green: 197/255.0, blue: 94/255.0, alpha: 1).cgColor
        v.layer.masksToBounds = true
        v.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        v.addTarget(self, action: #selector(selectedViewClicked), for: .touchUpInside)
        return v
    }()
    
    var isRadioButtonSelected = false
    weak var delegate: RadioButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(selectedView)
        
        NSLayoutConstraint.activate([
            
            selectedView.topAnchor.constraint(equalTo: topAnchor),
            selectedView.leftAnchor.constraint(equalTo: leftAnchor),
            selectedView.rightAnchor.constraint(equalTo: rightAnchor),
            selectedView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func selectedViewClicked() {
        animateView()
        
        delegate?.didClickRadioButtonWith(int: self.tag, and: isRadioButtonSelected)
    }
    
    func animateView() {
        
        if isRadioButtonSelected {
            
            isRadioButtonSelected = !isRadioButtonSelected
            
            UIView.animate(withDuration: 0.2, animations: { 
                self.selectedView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                self.layer.borderColor = UIColor.lightGray.cgColor
            })
            
        } else {
            
            isRadioButtonSelected = !isRadioButtonSelected
            
            UIView.animate(withDuration: 0.2, animations: {
                self.selectedView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.layer.borderColor = UIColor(red: 92/255.0, green: 197/255.0, blue: 94/255.0, alpha: 1).cgColor
            })
        }
    }
    
}
