//
//  Settings.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 31/03/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

class Settings: NSObject {

    private var _image: String!
    private var _name: String!
    private var _new: Bool!
    
    init(image: String, name: String, new: Bool) {
        self._image = image
        self._name = name
        self._new = new
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
    
    var new: Bool {
        get {
            return _new
        }
        set {
            _new = newValue
        }
    }
    
    static func getSettings() -> [Settings] {
        
        var settings = [Settings]()
        
        let titleNames = ["Betaling", "Help", "Promo Code", "Gratis eten", "Bezorgen met Uber", "Instellingen"]
        
        for (index, title) in titleNames.enumerated() {
            
            let setting = Settings()
            setting.image = title
            setting.name = title
            
            if index == 4 {
                setting.new = true
            } else {
                setting.new = false
            }
            
            settings.append(setting)
        }
        
        return settings
    }
    
    
}
