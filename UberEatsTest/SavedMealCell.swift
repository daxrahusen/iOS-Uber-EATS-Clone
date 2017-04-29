//
//  SavedMealCell.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 08/04/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

protocol SavedMealDelegate: class {
    func showHomeVC()
}

class SavedMealCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var exploreButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("BLADEREN IN RESTAURANTS", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleEdgeInsets = UIEdgeInsets(top: -30, left: 0, bottom: 0, right: 0)
        button.backgroundColor = UIColor(red: 92/255.0, green: 197/255.0, blue: 94/255.0, alpha: 1)
        button.addTarget(self, action: #selector(exploreButtonClicked), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: SavedMealDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        addSubview(exploreButton)
        
        NSLayoutConstraint.activate([
            
            exploreButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            exploreButton.leftAnchor.constraint(equalTo: leftAnchor),
            exploreButton.rightAnchor.constraint(equalTo: rightAnchor),
            exploreButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func exploreButtonClicked() {
        delegate?.showHomeVC()
    }
    
}
