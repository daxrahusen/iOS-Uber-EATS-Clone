//
//  CategoryCell.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 30/03/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    var category: Category? {
        didSet {
            setupContent()
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let overlayView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return v
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        addSubview(imageView)
        
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        imageView.addSubview(overlayView)
        
        overlayView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        overlayView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        overlayView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        overlayView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        overlayView.addSubview(nameLabel)
        
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: frame.height).isActive = true
    }
    
    private func setupContent() {
        
        if let category = category {
            
            imageView.image = UIImage(named: category.image)
            nameLabel.text = category.name
        }
    }
    
}
