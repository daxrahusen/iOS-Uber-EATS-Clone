//
//  TypeFoodCell.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 21/04/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

class TypeFoodCell: UITableViewCell {
    
    var title: String? {
        didSet {
            setupContent()
        }
    }
    
    lazy var radioButton: RadioButton = {
        let button = RadioButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clear
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(radioButtonClicked), for: .touchUpInside)
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let extraTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "+€1.00"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 13)
        label.isHidden = true
        return label
    }()
    
    let seperatorView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(white: 0.4, alpha: 1)
        return v
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        addSubview(radioButton)
        addSubview(seperatorView)
        addSubview(titleLabel)
        addSubview(extraTimeLabel)
        
        radioButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        radioButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        radioButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        radioButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: radioButton.rightAnchor, constant: 12).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        extraTimeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        extraTimeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        extraTimeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        extraTimeLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        seperatorView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        seperatorView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        seperatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        seperatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    func radioButtonClicked() {
        
        radioButton.selectedViewClicked()
    }
    
    private func setupContent() {
    
        guard let title = title else { return }
        
        titleLabel.text = title
    }
    
}
