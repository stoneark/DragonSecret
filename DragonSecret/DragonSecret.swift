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
        return DragonSecret.getBirthday(id: id) ?? Date()
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
    
    public static func getBirthday(id: String) -> Date? {
        let startIndex = id.index(id.startIndex, offsetBy: 6)
        let endIndex = id.index(startIndex, offsetBy: 8)
        let birthdayString = id[startIndex..<endIndex]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        if let date = dateFormatter.date(from: String(birthdayString)) {
            return date
        } else {
            return nil
        }
    }
    
    public static func check(id: String) -> Bool {
        return regexCheck(id) && addressCheck(id) && birthdayCheck(id) && lastCheck(id)
    }
    
    private static func regexCheck(_ id: String) -> Bool {
        guard id.count == 18 else {
            return false
        }
        let rangeOfRegex = id.range(of: #"\d{17}(\d|X|x)"#, options:.regularExpression)
        return rangeOfRegex != nil
    }
    
    private static func addressCheck(_ id: String) -> Bool {
        return true
    }
    
    private static func birthdayCheck(_ id: String) -> Bool {
        return DragonSecret.getBirthday(id: id) != nil
    }
    
    private static func lastCheck(_ id: String) -> Bool {
        let weight = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1]
        var sigma = id.dropLast().enumerated().reduce(0, {$0 + $1.element.wholeNumberValue! * weight[$1.offset]})
        if let checksum = id.last?.wholeNumberValue {
            sigma = sigma + checksum
        } else {
            sigma = sigma + 10
        }
        return sigma % 11 == 1
    }
}
