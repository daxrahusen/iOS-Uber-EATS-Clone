//
//  ContentTextField.swift
//  TongerenApp
//
//  Created by Dax Rahusen on 25/01/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

class ImageTextField: UITextField {

    let padding = UIEdgeInsets(top: -10, left: 40, bottom: 0, right: 5);
    
    var leftImage: UIImage? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        
        leftViewMode = .always
        
        let imageViewRect = CGRect(x: 5, y: 0, width: 20, height: 20)
        let imageView = UIImageView(frame: imageViewRect)
        imageView.contentMode = .scaleAspectFit
        imageView.image = leftImage?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        imageView.tintColor = UIColor.black
        
        let viewRect = CGRect(x: 0, y: 0, width: 25, height: 30)
        let view = UIView(frame: viewRect)
        
        view.addSubview(imageView)
        
        leftView = view
    }
    
    func placeholder(text: String, withfont size: CGFloat) {
        
        attributedPlaceholder = NSAttributedString(string: text, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: size)])
        
        font = UIFont.systemFont(ofSize: size)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }

}
