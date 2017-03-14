//
//  DetailHeader.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 12/03/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit
import Hero

class DetailHeader: UIView {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "uberEatsImage")
        imageView.clipsToBounds = true
        imageView.heroID = "heroImageViewID"
        return imageView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heroID = "heroContentViewID"
        view.heroModifiers = [.scale(0.5)]
        view.elevate(elevation: 2.0)
        return view
    }()
    
    let restaurantTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Roti Shop"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let restaurantDetailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Zuid Amerikaans • Broodjes • Indonesisch • €€"
        label.textAlignment = .center
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25 - 35 / MIN"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let clockImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        let image = #imageLiteral(resourceName: "Clock").withRenderingMode(.alwaysTemplate)
        iv.image = image
        iv.tintColor = .lightGray
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    let openingsTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "12:00 PM - 11:00 PM"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        
        addSubview(containerView)
        
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 140).isActive = true
        containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        containerView.addSubview(restaurantTitleLabel)
        
        restaurantTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 54).isActive = true
        restaurantTitleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        restaurantTitleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true
        restaurantTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        containerView.addSubview(restaurantDetailLabel)
        
        restaurantDetailLabel.topAnchor.constraint(equalTo: restaurantTitleLabel.bottomAnchor, constant: 4).isActive = true
        restaurantDetailLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        restaurantDetailLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true
        restaurantDetailLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        containerView.addSubview(timeLabel)
        
        timeLabel.topAnchor.constraint(equalTo: restaurantDetailLabel.bottomAnchor, constant: 8).isActive = true
        timeLabel.leftAnchor.constraint(equalTo: restaurantDetailLabel.leftAnchor, constant: 16).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: restaurantDetailLabel.rightAnchor, constant: -16).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(openingsTimeLabel)
        
        openingsTimeLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 16).isActive = true
        openingsTimeLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 8).isActive = true
        openingsTimeLabel.widthAnchor.constraint(equalToConstant: 148).isActive = true
        openingsTimeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
        addSubview(clockImage)
        
        clockImage.topAnchor.constraint(equalTo: openingsTimeLabel.topAnchor).isActive = true
        clockImage.rightAnchor.constraint(equalTo: openingsTimeLabel.leftAnchor, constant: 1).isActive = true
        clockImage.heightAnchor.constraint(equalTo: openingsTimeLabel.heightAnchor).isActive = true
        clockImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
        
    }

}

extension UIView {
    
    func elevate(elevation: Double) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: elevation)
        self.layer.shadowRadius = CGFloat(elevation)
        self.layer.shadowOpacity = 0.24
    }
}
