//
//  DragonSecret.swift
//  DragonSecret
//
//  Created by StoneArk on 2019/4/20.
//  Copyright © 2019 StoneArk. All rights reserved.
//

import Foundation

public enum Gender {
    case Male, Female, Unknown
}

public class DragonSecret {
    public var id: String
    
    public var province: String {
        return "PROVINCE"
    }
    
    public var city: String {
        return "CITY"
    }
    
    public var district: String {
        return "DISTRICT"
    }
    
    public var address: String {
        return province + city + district
    }
    
    public var birthday: Date {
        let startIndex = id.index(id.startIndex, offsetBy: 6)
        let endIndex = id.index(startIndex, offsetBy: 8)
        let birthdayString = id[startIndex..<endIndex]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMDD"
        if let date = dateFormatter.date(from: String(birthdayString)) {
            return date
        } else {
            return Date()
        }
    }
    
    public var gender: Gender {
        if let genderChar = id.dropLast().last, let genderNumber = genderChar.wholeNumberValue {
            return (genderNumber % 2 == 0) ? .Female : .Male
        }
        return .Unknown
    }
    
    public init?(id: String) {
        if (DragonSecret.check(id: id)) {
            self.id = id
        } else {
            return nil
        }
    }
    
    public static func check(id: String) -> Bool {
        return regexCheck(id) && addressCheck(id) && birthdayCheck(id) && lastCheck(id)
    }
    
    private static func regexCheck(_ id: String) -> Bool {
        return true
    }
    
    private static func addressCheck(_ id: String) -> Bool {
        return true
    }
    
    private static func birthdayCheck(_ id: String) -> Bool {
        return true
    }
    
    private static func lastCheck(_ id: String) -> Bool {
        return true
    }
}
