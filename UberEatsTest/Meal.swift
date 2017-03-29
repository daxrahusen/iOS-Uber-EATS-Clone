//
//  Meal.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 13/03/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

class Meal: NSObject {

    private var _title: String!
    private var _detail: String!
    private var _price: String!
    
    override init() { }

    init(title: String, detail: String, price: String) {
        self._title = title
        self._detail = detail
        self._price = price
    }
    
    var title: String? {
        get {
            return _title
        }
        set {
            _title = newValue
        }
    }
    
    var detail: String? {
        get {
            return _detail
        }
        set {
            _detail = newValue
        }
    }
    
    var price: String? {
        get {
            return _price
        }
        set {
            _price = "€\(newValue ?? "")"
        }
    }
    
    static func getMeals() -> [Meal] {
        
        let titles = ["Bami Mix", "Roti Pikante Kipfilet", "Roti Kipfilet", "Bakabana met Saté Saus"]
        let details = ["Kipfilet en lamsvlees", "Keuze uit: gewoon en speciaal", "Keuze uit: gewoon en speciaal", "Gebakken banaan"]
        let prices = ["9.50", "8.50", "8.50", "2.00"]
        
        var meals = [Meal]()
        
        for index in 0...3 {
            
            let meal = Meal(title: titles[index], detail: details[index], price: prices[index])
            meals.append(meal)
        }
        
        return meals
    }
    
}
