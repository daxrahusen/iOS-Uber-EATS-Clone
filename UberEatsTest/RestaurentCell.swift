//
//  RestaurentCell.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 12/03/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit
import Hero

class RestaurentCell: UICollectionViewCell {
    
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Jouw favorieten"
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    let restaurantImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "uberEatsImage")
        iv.heroID = "heroImageViewID"
        return iv
    }()
    
    let restaurantNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Roti Shop"
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "35 - 45 MIN"
        return label
    }()
    
    let restaurantDetailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Zuid Amerikaans • Broodjes • Indonesisch • €€"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        contentView.heroID = "heroContentViewID"
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        
        addSubview(sectionLabel)
        
        sectionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        sectionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        sectionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        sectionLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        addSubview(restaurantImageView)
        
        restaurantImageView.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 22).isActive = true
        restaurantImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        restaurantImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        restaurantImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        addSubview(restaurantNameLabel)
        
        restaurantNameLabel.topAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: 12).isActive = true
        restaurantNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        restaurantNameLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        restaurantNameLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(timeLabel)
        
        timeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        addSubview(restaurantDetailLabel)
        
        restaurantDetailLabel.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor).isActive = true
        restaurantDetailLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        restaurantDetailLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        restaurantDetailLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
}


































