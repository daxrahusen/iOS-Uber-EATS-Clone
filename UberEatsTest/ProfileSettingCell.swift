//
//  ProfileSettingCell.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 31/03/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

class ProfileSettingCell: UITableViewCell {
    
    var setting: Settings? {
        didSet {
            updateContent()
        }
    }
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.image?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .black
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    let newLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(red: 92/255.0, green: 197/255.0, blue: 94/255.0, alpha: 1)
        label.text = "Nieuw"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.layer.cornerRadius = 2
        label.layer.masksToBounds = true
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(newLabel)
        
        NSLayoutConstraint.activate([
            
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 16),
            titleLabel.widthAnchor.constraint(equalToConstant: 250),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            newLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            newLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            newLabel.widthAnchor.constraint(equalToConstant: 40),
            newLabel.heightAnchor.constraint(equalToConstant: 18)
            
        ])
    }
    
    private func updateContent() {
        
        if let setting = setting {
            
            iconImageView.image = UIImage(named: setting.image)?.withRenderingMode(.alwaysTemplate)
            titleLabel.text = setting.name
            newLabel.isHidden = !setting.new
        }
    }
}
