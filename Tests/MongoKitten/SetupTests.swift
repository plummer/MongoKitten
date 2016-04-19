//
//  SetupTests.swift
//  MongoKitten
//
//  Created by Joannis Orlandos on 23/03/16.
//  Copyright © 2016 PlanTeam. All rights reserved.
//

import MongoKitten
import XCTest
import Foundation

class SetupTests: XCTestCase {
    static var allTests: [(String, SetupTests -> () throws -> Void)] {
        return [
            ("testSetup", testSetup),
        ]
    }
    
    override func setUp() {
        super.setUp()

        try! TestManager.connect()
        
        try! TestManager.clean()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSetup() {
        // TODO:
        // using: (username: "mongokitten-unittest-user", password: "mongokitten-unittest-password"),
        let server = try! Server(at: "127.0.0.1", automatically: true)
        
        let database = server["mongokitten-unittest"]
        
        let testCollection = database["testcollection"]
        let testBucket = database["bucket.collection"]
        
        XCTAssertEqual(testBucket.database.name, "mongokitten-unittest")
        XCTAssertEqual(database.name, "mongokitten-unittest")
        XCTAssertEqual(testCollection.database.name, "mongokitten-unittest")
    }
}