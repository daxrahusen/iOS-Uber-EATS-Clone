//
//  OrderCell.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 02/04/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

class OrderCell: UICollectionViewCell {
    
    let orderImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "meal")
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let orderGradientView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        return view
    }()
    
    let restaurantLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "Roti Shop\nMENU WEERGEVEN"
        label.textColor = .white
        label.textAlignment = .center
        label.setLineHeight(lineHeight: 1.2)
        label.numberOfLines = 2
        return label
    }()
    
    let checkImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        let image = #imageLiteral(resourceName: "Checkmark").withRenderingMode(.alwaysTemplate)
        iv.image = image
        iv.tintColor = UIColor(red: 92/255.0, green: 197/255.0, blue: 94/255.0, alpha: 1)
        return iv
    }()
    
    lazy var orderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        return label
    }()
    
    let topSeperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        return view
    }()
    
    let amountMealTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.text = "1"
        tf.textAlignment = .center
        tf.borderStyle = .none
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.2).cgColor
        tf.font = UIFont.systemFont(ofSize: 12)
        tf.backgroundColor = .white
        tf.isEnabled = false
        return tf
    }()
    
    let mealLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Roti Rundvlees"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let middleSeperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        return view
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Totaal: €11.00"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    let reorderButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("OPNIEUW BESTELLEN", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.backgroundColor = UIColor(red: 92/255.0, green: 197/255.0, blue: 94/255.0, alpha: 1)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        return button
    }()
    
    let bottomSeperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        return view
    }()
    
    let buttonsStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.axis = .horizontal
        return sv
    }()
    
    let invoiceButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("BEKIJK FACTUUR", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1)
        return button
    }()
    
    let stackSeperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        return view
    }()
    
    let helpButon: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("GA NAAR HELP", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupViews()
        setupStackView()
        setupContent()
    }
    
    private func setupStackView() {
        
        let views = [invoiceButton, helpButon]
        
        for stack in views {
            buttonsStackView.addArrangedSubview(stack)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        addSubview(orderImageView)
        addSubview(orderGradientView)
        addSubview(restaurantLabel)
        addSubview(checkImageView)
        addSubview(orderLabel)
        addSubview(topSeperatorView)
        addSubview(amountMealTextField)
        addSubview(mealLabel)
        addSubview(middleSeperatorView)
        addSubview(priceLabel)
        addSubview(reorderButton)
        addSubview(bottomSeperatorView)
        addSubview(buttonsStackView)
        addSubview(stackSeperatorView)
        
        NSLayoutConstraint.activate([
            
            orderImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            orderImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            orderImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            orderImageView.heightAnchor.constraint(equalToConstant: 90),
            
            orderGradientView.topAnchor.constraint(equalTo: orderImageView.topAnchor),
            orderGradientView.leftAnchor.constraint(equalTo: orderImageView.leftAnchor),
            orderGradientView.rightAnchor.constraint(equalTo: orderImageView.rightAnchor),
            orderGradientView.bottomAnchor.constraint(equalTo: orderImageView.bottomAnchor),
            
            restaurantLabel.centerXAnchor.constraint(equalTo: orderImageView.centerXAnchor),
            restaurantLabel.centerYAnchor.constraint(equalTo: orderImageView.centerYAnchor),
            restaurantLabel.heightAnchor.constraint(equalToConstant: 40),
            restaurantLabel.widthAnchor.constraint(equalToConstant: 200),
            
            checkImageView.topAnchor.constraint(equalTo: orderGradientView.bottomAnchor, constant: 12),
            checkImageView.leftAnchor.constraint(equalTo: orderGradientView.leftAnchor),
            checkImageView.heightAnchor.constraint(equalToConstant: 18),
            checkImageView.widthAnchor.constraint(equalToConstant: 18),
            
            orderLabel.topAnchor.constraint(equalTo: orderGradientView.bottomAnchor, constant: 12),
            orderLabel.leftAnchor.constraint(equalTo: checkImageView.rightAnchor, constant: 12),
            orderLabel.rightAnchor.constraint(equalTo: orderGradientView.rightAnchor),
            orderLabel.heightAnchor.constraint(equalToConstant: 55),
            
            topSeperatorView.topAnchor.constraint(equalTo: orderLabel.bottomAnchor, constant: 12),
            topSeperatorView.leftAnchor.constraint(equalTo: orderGradientView.leftAnchor),
            topSeperatorView.rightAnchor.constraint(equalTo: orderGradientView.rightAnchor),
            topSeperatorView.heightAnchor.constraint(equalToConstant: 1),
            
            amountMealTextField.leftAnchor.constraint(equalTo: topSeperatorView.leftAnchor),
            amountMealTextField.topAnchor.constraint(equalTo: topSeperatorView.bottomAnchor, constant: 12),
            amountMealTextField.heightAnchor.constraint(equalToConstant: 20),
            amountMealTextField.widthAnchor.constraint(equalToConstant: 20),
            
            mealLabel.topAnchor.constraint(equalTo: amountMealTextField.topAnchor),
            mealLabel.leftAnchor.constraint(equalTo: amountMealTextField.rightAnchor, constant: 12),
            mealLabel.rightAnchor.constraint(equalTo: orderGradientView.rightAnchor),
            mealLabel.heightAnchor.constraint(equalToConstant: 20),
            
            middleSeperatorView.topAnchor.constraint(equalTo: amountMealTextField.bottomAnchor, constant: 12),
            middleSeperatorView.leftAnchor.constraint(equalTo: orderGradientView.leftAnchor),
            middleSeperatorView.rightAnchor.constraint(equalTo: orderGradientView.rightAnchor),
            middleSeperatorView.heightAnchor.constraint(equalToConstant: 1),
            
            priceLabel.topAnchor.constraint(equalTo: middleSeperatorView.bottomAnchor, constant: 12),
            priceLabel.leftAnchor.constraint(equalTo: middleSeperatorView.leftAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 55),
            priceLabel.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 24),
            
            reorderButton.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            reorderButton.rightAnchor.constraint(equalTo: middleSeperatorView.rightAnchor),
            reorderButton.heightAnchor.constraint(equalToConstant: 45),
            reorderButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 24),
            
            bottomSeperatorView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 12),
            bottomSeperatorView.leftAnchor.constraint(equalTo: leftAnchor),
            bottomSeperatorView.rightAnchor.constraint(equalTo: rightAnchor),
            bottomSeperatorView.heightAnchor.constraint(equalToConstant: 1),
            
            buttonsStackView.topAnchor.constraint(equalTo: bottomSeperatorView.bottomAnchor),
            buttonsStackView.leftAnchor.constraint(equalTo: leftAnchor),
            buttonsStackView.rightAnchor.constraint(equalTo: rightAnchor),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 42),
            
            stackSeperatorView.centerXAnchor.constraint(equalTo: buttonsStackView.centerXAnchor),
            stackSeperatorView.topAnchor.constraint(equalTo: buttonsStackView.topAnchor),
            stackSeperatorView.bottomAnchor.constraint(equalTo: buttonsStackView.bottomAnchor),
            stackSeperatorView.widthAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func setupContent() {
    
        orderLabel.attributedText = setAttributedString(label: orderLabel)
    }
    
    private func setAttributedString(label: UILabel) -> NSAttributedString {
        
        let status = "Bestelling bezorgd\n"
        let date = "12 mrt. 2017 19:08\n"
        let orderNummer = "Ordernr. F51XA"
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.0
        paragraphStyle.lineHeightMultiple = 1.1
        paragraphStyle.alignment = label.textAlignment
        
        let primaryString = NSMutableAttributedString(string: status, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.black])
        
        let secondString = NSMutableAttributedString(string: date, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 13), NSForegroundColorAttributeName: UIColor.lightGray])
        primaryString.append(secondString)
        
        let thirdString = NSMutableAttributedString(string: orderNummer, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 13), NSForegroundColorAttributeName: UIColor.lightGray])
        
        primaryString.append(thirdString)
        
        primaryString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: .init(location: 0, length: primaryString.length))
        
        return primaryString
    }
    
}





















