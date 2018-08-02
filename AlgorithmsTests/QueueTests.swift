//
//  QueueTests.swift
//  AlgorithmsTests
//
//  Created by Santiago Carmona Gonzalez on 3/17/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import XCTest
@testable import Algorithms

class QueueTests: BaseTest {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testDequeue() {
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
    
    func testDequeueSlowly() {
        var queueOfStrings = Queue<String>()
        for i in 0...1_000_000 {
            queueOfStrings.enqueue(value: "\(i) iteracion")
        }
        
        var containsElements = true
        var stringToPrint = ""
        
        Utils.test(algorithm: "Dequeue slowly way") {
            while containsElements {
                if let value = queueOfStrings.dequeueSlowly() {
                    stringToPrint += value
                } else {
                    containsElements = false
                }
            }
            XCTAssert(true)
        }
    }
    
}
