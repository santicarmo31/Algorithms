//
//  QueueTests.swift
//  AlgorithmsTests
//
//  Created by Santiago Carmona Gonzalez on 3/17/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import XCTest
@testable import Algorithms

class QueueTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /**
     * Working with a queue
     */
    func testExample() {
        var queueOfStrings = Queue<String>()
        for i in 0...1_000_000 {
            queueOfStrings.enqueue(value: "\(i) iteracion")
        }

        var containsElements = true
        var stringToPrint = ""

        Utils.test(algorithm: "Dequeue") {
            while containsElements {
                if let value = queueOfStrings.dequeue() {
                    stringToPrint += value
                } else {
                    containsElements = false
                }
            }
            XCTAssert(true)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
