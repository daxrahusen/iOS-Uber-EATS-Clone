//
//  StepperView.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 23/04/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

protocol StepperViewDelegate: class {
    func updateAmountNumber(amount: Int)
}

class StepperView: UIView {
    
    var stepperNumber = 1
    
    lazy var decreaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.tintColor = .black
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(decreaseButtonClicked), for: .touchUpInside)
        return button
    }()

    lazy var increaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.tintColor = .black
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(increaseButtonClicked), for: .touchUpInside)
        return button
    }()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.backgroundColor = .clear
        return label
    }()
    
    weak var delegate: StepperViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        let stackView = UIStackView(arrangedSubviews: [decreaseButton, amountLabel, increaseButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    //MARK: - Actions
    
    func decreaseButtonClicked() {
        
        if stepperNumber != 1 {
            
            stepperNumber -= 1
            
            amountLabel.text = "\(stepperNumber)"
            
            delegate?.updateAmountNumber(amount: stepperNumber)
        }
    }
    
    func increaseButtonClicked() {
        
        stepperNumber += 1
        
        amountLabel.text = "\(stepperNumber)"
        
        delegate?.updateAmountNumber(amount: stepperNumber)
    }

}
