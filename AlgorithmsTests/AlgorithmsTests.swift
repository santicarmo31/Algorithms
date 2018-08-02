//
//  AlgorithmsTests.swift
//  AlgorithmsTests
//
//  Created by Santiago Carmona Gonzalez on 3/17/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import XCTest
@testable import Algorithms

class AlgorithmsTests: BaseTest {
    
    var insertionList: [Int] = []
    
    override func setUp() {
        super.setUp()
        guard let list = load(jsonNamed: "list") as? [Int] else {
            fatalError()
        }
        
        insertionList = list
    }
    
    override func tearDown() {        
        super.tearDown()
    }        
    
    func testInsertionSort() {
        let sortedNumbers = insertionList.sorted()
        Utils.test(algorithm: "Insertion sort", closure: {
            XCTAssertEqual(sortedNumbers, Sort.insertionSort(insertionList, <))
        })
    }
    
    func testInsertionSortWithoutSwap() {
        let sortedNumbers = insertionList.sorted(by: >)
        Utils.test(algorithm: "Insertion sort without swap", closure: {
            XCTAssertEqual(sortedNumbers, Sort.insertionSortWithoutSwap(insertionList, >))
        })
    }
    
    func testExample() {
        let node = Node(value: 7)
        node.insert(value: 2)
        node.insert(value: 1)
        node.insert(value: 5)
        node.insert(value: 10)
        node.traverse()
    }
}
