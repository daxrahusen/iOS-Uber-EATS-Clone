
//
//  PagingCell.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 01/04/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

class PagingCell: UICollectionViewCell {
 
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: frame.width - 10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            titleLabel.textColor = isHighlighted ? .black : .lightGray
        }
    }
    
    override var isSelected: Bool {
        didSet {
            titleLabel.textColor = isSelected ? .black : .lightGray
        }
    }
    
    
}
