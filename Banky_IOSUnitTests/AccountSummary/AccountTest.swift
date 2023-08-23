//
//  AccountTest.swift
//  Banky_IOSUnitTests
//
//  Created by Enigma Kod on 23/08/2023.
//

import Foundation
import XCTest

@testable import Banky_IOS

class AccountTest: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    func testCanParse() throws {
        let json = """
         [
           {
             "id": "1",
             "type": "Banking",
             "name": "Basic Savings",
             "amount": 929466.23,
             "createdDateTime" : "2010-06-21T15:29:32Z"
           },
           {
             "id": "2",
             "type": "Banking",
             "name": "No-Fee All-In Chequing",
             "amount": 17562.44,
             "createdDateTime" : "2011-06-21T15:29:32Z"
           },
          ]
        """
        
        let data = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let result: [Account] = try decoder.decode([Account].self, from: data)
        
        XCTAssertEqual(result.count, 2)
        
        let account = result[0]
        XCTAssertEqual(account.id, "1")
        XCTAssertEqual(account.type, .Banking)
        XCTAssertEqual(account.name, "Basic Savings")
        XCTAssertEqual(account.amount, 929466.23)
    }
}
