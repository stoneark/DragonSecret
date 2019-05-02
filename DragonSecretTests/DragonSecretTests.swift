//
//  DragonSecretTests.swift
//  DragonSecretTests
//
//  Created by StoneArk on 2019/4/20.
//  Copyright © 2019 StoneArk. All rights reserved.
//

import XCTest
@testable import DragonSecret

class DragonSecretTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCheckValid() {
        // Valid
        XCTAssert(DragonSecret.check(id: "110101199001011237") == true)
        // Valid with character x
        XCTAssert(DragonSecret.check(id: "11010119900101127x") == true)
        // Invalid length
        XCTAssert(DragonSecret.check(id: "11010119900101123") == false)
        // Invalid char
        XCTAssert(DragonSecret.check(id: "11010119900101127y") == false)
        // Invalid address
        XCTAssert(DragonSecret.check(id: "010101199001011233") == false)
        // Invalid birth month
        XCTAssert(DragonSecret.check(id: "110101199013011234") == false)
        // Invalid birth day
        XCTAssert(DragonSecret.check(id: "110101199012351237") == false)
        // Invalid last check number
        XCTAssert(DragonSecret.check(id: "110101199001011230") == false)
    }
    
    func testBirthday() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMDD"
        
        if let dragon = DragonSecret(id: "110101199001011237"), let correctDate = dateFormatter.date(from: "19900101") {
            XCTAssert(dragon.birthday.compare(correctDate) == .orderedSame)
        }
    }
    
    func testProvince() {
        if let dragon = DragonSecret(id: "370902199001011235") {
            XCTAssert(dragon.province == "山东省")
        }
    }
    
    func testCity() {
        if let dragon = DragonSecret(id: "370902199001011235") {
            XCTAssert(dragon.city == "泰安市")
        }
    }
    
    func testDistrict() {
        if let dragon = DragonSecret(id: "370902199001011235") {
            XCTAssert(dragon.district == "泰山区")
        }
    }
    
    func testAddress() {
        if let dragon = DragonSecret(id: "370103199001011238") {
            XCTAssert(dragon.address == "山东省济南市市中区")
        }
        if let dragon = DragonSecret(id: "110105199001011232") {
            XCTAssert(dragon.address == "北京市朝阳区")
        }
    }

}
