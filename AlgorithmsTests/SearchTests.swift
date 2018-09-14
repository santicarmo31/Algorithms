//
//  SearchTests.swift
//  AlgorithmsTests
//
//  Created by Santiago Carmona Gonzalez on 7/31/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import XCTest
@testable import Algorithms

class SearchTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
       let array = [-1,0,1,2,3,5]
        print(Search.binarySearch(element: 0, in: array, range: 0..<array.count))
    }
    
    func testBoyerMoore() {
        let text = "santiago"
        print(text.index(of: "ago"))
    }
}
