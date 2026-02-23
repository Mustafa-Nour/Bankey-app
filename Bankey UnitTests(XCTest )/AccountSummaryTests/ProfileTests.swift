//
//  ProfileTest.swift
//  Bankey UnitTests(XCTest )
//
//  Created by Mustafa Nour on 19/02/2026.
//

import Foundation
import XCTest
import UIKit

    // let me access app components
@testable import Bankey_App

class  ProfileTests: XCTest {
    //setting up the test
    override func setUp() {
        super.setUp()
    }
    
    func testCanParse() throws {
        let json = """
        {   
        "id": "1",
        "first_name": "Kevin",
        "last_name": "Flynn",
        },
        {
            "id": "1",
            "type": "Banking",
            "name": "Basic Savings",
            "amount": 929466.23,
            "createdDateTime" : "2010-06-21T15:29:32Z"
          }
        """
        let data = json.data(using: .utf8)!
        let result = try! JSONDecoder().decode(Profile.self, from: data)
        
        XCTAssertEqual(result.id , "1")
        XCTAssertEqual(result.firstName , "kevin")
        XCTAssertEqual(result.lastName , "Flynna")
    }
    
    
}
