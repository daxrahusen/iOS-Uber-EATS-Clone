//
//  DetailHeaderCell.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 13/03/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

class DetailTableHeader: UIView {

    let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Meest Populair"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        addSubview(headerLabel)
        
        headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 22).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        headerLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        addSubview(separator)
        
        separator.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 18).isActive = true
        separator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        separator.widthAnchor.constraint(equalToConstant: 45).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }

}
