//
//  NavigationBar.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 12/03/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit
import ImageIO

protocol NavigationBarDelegate: class {
    func dismissVC()
}

class NavigationBar: UIView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.tintColor = .black
        button.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        return button
    }()
    
    let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.tintColor = .black
        return button
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        return view
    }()
    
    var isNavigationBarVisible = false
    var navTopConstraint: NSLayoutConstraint?
    
    weak var delegate: NavigationBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        navTopConstraint = topAnchor.constraint(equalTo: topAnchor, constant: 64)
        
        addSubview(titleLabel)
        addSubview(separatorView)
        addSubview(backButton)
        addSubview(shareButton)
        
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            titleLabel.widthAnchor.constraint(equalToConstant: 240),
            
            backButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            backButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 8),
            backButton.heightAnchor.constraint(equalToConstant: 18),
            backButton.widthAnchor.constraint(equalToConstant: 18),
            
            shareButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            shareButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 8),
            shareButton.heightAnchor.constraint(equalToConstant: 20),
            shareButton.widthAnchor.constraint(equalToConstant: 20),
            
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorView.leftAnchor.constraint(equalTo: leftAnchor),
            separatorView.rightAnchor.constraint(equalTo: rightAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
            
        ])
    }
    
    func set(startText: String, withImage image: UIImage, and endText: String) {
        
        let startString = NSMutableAttributedString(string: startText)
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.bounds = CGRect(x: 0, y: -3, width: 18, height: 18)
        imageAttachment.image = image
        
        let imageString = NSAttributedString(attachment: imageAttachment)
        
        startString.append(imageString)
        startString.append(NSAttributedString(string: endText))
        
        titleLabel.attributedText = startString
    }
    
    
    func backButtonClicked() {
        delegate?.dismissVC()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
