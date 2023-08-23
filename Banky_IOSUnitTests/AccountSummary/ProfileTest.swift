//
//  ProfileTest.swift
//  Banky_IOSUnitTests
//
//  Created by Enigma Kod on 23/08/2023.
//

import Foundation
import XCTest

@testable import Banky_IOS

class ProfileTest: XCTestCase {
    override class func setUp() {
        super.setUp()
    }

    func testCanParse() throws {
        let json = """
        {
        "id": "1",
        "first_name": "Kevin",
        "last_name": "Flynn",
        }
        """

        let data = json.data(using: .utf8)!
        let result = try! JSONDecoder().decode(Profile.self, from: data)

        XCTAssertEqual(result.id, "1")
        XCTAssertEqual(result.firstName, "Kevin")
        XCTAssertEqual(result.lastName, "Flynn")
    }
}
