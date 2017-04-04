//
//  ProfileHeader.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 31/03/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

class ProfileHeader: UIView {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "dummy")
        iv.layer.cornerRadius = 20
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Jaap van der Wall"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let seperatorLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(seperatorLine)
        
        NSLayoutConstraint.activate([
            
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 12),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.widthAnchor.constraint(equalToConstant: 250),
            
            seperatorLine.bottomAnchor.constraint(equalTo: bottomAnchor),
            seperatorLine.leftAnchor.constraint(equalTo: leftAnchor),
            seperatorLine.rightAnchor.constraint(equalTo: rightAnchor),
            seperatorLine.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}
