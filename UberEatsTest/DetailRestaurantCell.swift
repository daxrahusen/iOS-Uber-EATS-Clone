//
//  DetailRestaurantCell.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 13/03/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

class DetailRestaurantCell: UITableViewCell {

    let titleMealLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 2
        return label
    }()
    
    let detailMealLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let priceMealLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let mealImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "meal")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.6).cgColor
        iv.layer.borderWidth = 0.5
        return iv
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8)
        return view
    }()
    
    var meal: Meal? {
        didSet {
            setupContent()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        addSubview(mealImageView)
        
        mealImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mealImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        mealImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        mealImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        addSubview(titleMealLabel)
        
        titleMealLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        titleMealLabel.topAnchor.constraint(equalTo: mealImageView.topAnchor).isActive = true
        titleMealLabel.widthAnchor.constraint(equalToConstant: frame.width / 2).isActive = true
        titleMealLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(detailMealLabel)
        
        detailMealLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        detailMealLabel.topAnchor.constraint(equalTo: titleMealLabel.bottomAnchor, constant: 16).isActive = true
        detailMealLabel.rightAnchor.constraint(equalTo: mealImageView.leftAnchor, constant: -16).isActive = true
        detailMealLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(priceMealLabel)

        priceMealLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        priceMealLabel.topAnchor.constraint(equalTo: detailMealLabel.bottomAnchor, constant: 16).isActive = true
        priceMealLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        priceMealLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(separatorView)
        
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        separatorView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        
    }
    
    private func setupContent() {
        
        if let meal = self.meal {
            
            titleMealLabel.text = meal.title
            detailMealLabel.text = meal.detail
            priceMealLabel.text = meal.price
        }
    }
    
    
    
}











