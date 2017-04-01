//
//  Category.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 30/03/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import Foundation

class Category: NSObject {
    
    private var _image: String!
    private var _name: String!
    
    init(image: String, name: String) {
        self._image = image
        self._name = name
    }
    
    override init() { }
    
    var image: String {
        get {
            return _image
        }
        set {
            _image = newValue
        }
    }
    
    var name: String {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    
    static func getFoodCategories() -> [Category] {
        
        var categories = [Category]()
        
        let imageNames = ["pizza", "sushi", "dessert", "italian", "thai", "bbq", "alcohol", "indian"]
        
        for name in imageNames {
            
            let category = Category(image: name, name: name.capitalized)
            
            categories.append(category)
        }
        
        return categories
    }
}
