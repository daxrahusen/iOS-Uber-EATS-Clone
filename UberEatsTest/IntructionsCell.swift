//
//  IntructionsCell.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 23/04/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

class IntructionsCell: UITableViewCell {

    let notesTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.placeholder = "Notitie toevoegen (extra saus, geen uitjes, enz.)"
        tf.tintColor = UIColor(red: 92/255.0, green: 197/255.0, blue: 94/255.0, alpha: 1)
        return tf
    }()
    
    let seperatorView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return v
    }()
    
    lazy var stepperView: StepperView = {
        let sv = StepperView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.layer.cornerRadius = 30
        sv.layer.borderWidth = 2
        sv.layer.borderColor = UIColor.lightGray.cgColor
        return sv
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        addSubview(notesTextField)
        addSubview(seperatorView)
        addSubview(stepperView)
        
        NSLayoutConstraint.activate([
            
            notesTextField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            notesTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            notesTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            notesTextField.heightAnchor.constraint(equalToConstant: 44),
            
            seperatorView.topAnchor.constraint(equalTo: notesTextField.bottomAnchor, constant: 8),
            seperatorView.leftAnchor.constraint(equalTo: notesTextField.leftAnchor),
            seperatorView.rightAnchor.constraint(equalTo: notesTextField.rightAnchor),
            seperatorView.heightAnchor.constraint(equalToConstant: 1),
            
            stepperView.topAnchor.constraint(equalTo: seperatorView.bottomAnchor, constant: 40),
            stepperView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stepperView.widthAnchor.constraint(equalToConstant: 140),
            stepperView.heightAnchor.constraint(equalToConstant: 60)
            
        ])
        
    }
}
