//
//  DragonSecret.swift
//  DragonSecret
//
//  Created by StoneArk on 2019/4/20.
//  Copyright © 2019 StoneArk. All rights reserved.
//

import Foundation

enum Gender {
    case Male, Female
}

class DragonSecret {
    var id: String
    
    var province: String {
        return "PROVINCE"
    }
    
    var city: String {
        return "CITY"
    }
    
    var district: String {
        return "DISTRICT"
    }
    
    var address: String {
        return province + city + district
    }
    
    var birthday: Date {
        return Date()
    }
    
    var gender: Gender {
        return .Male
    }
    
    init?(id: String) {
        if (DragonSecret.check(id: id)) {
            self.id = id
        } else {
            return nil
        }
    }
    
    static func check(id: String) -> Bool {
        return regexCheck(id) && addressCheck(id) && birthdayCheck(id) && lastCheck(id)
    }
    
    static private func regexCheck(_ id: String) -> Bool {
        return true
    }
    
    static private func addressCheck(_ id: String) -> Bool {
        return true
    }
    
    static private func birthdayCheck(_ id: String) -> Bool {
        return true
    }
    
    static private func lastCheck(_ id: String) -> Bool {
        return true
    }
}
