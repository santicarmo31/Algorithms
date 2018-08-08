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
}

// MARK: - Sorts
extension AlgorithmsTests {
    
    // MARK: - Insertion
    
    func testInsertionSort() {
        let sortedNumbers = insertionList.sorted()
        Utils.test(algorithm: "Insertion sort", closure: {
            XCTAssertEqual(sortedNumbers, Sort.insertionSort(insertionList, <))
        })
    }
    
    func testInsertionSortWithoutSwap() {
        let sortedNumbers = insertionList.sorted(by: >)
        Utils.test(algorithm: "Insertion sort without swap with list of \(insertionList.count) elements", closure: {
            XCTAssertEqual(sortedNumbers, Sort.insertionSortWithoutSwap(insertionList, >))
        })
    }
    
    // MARK: - Merge
    
    func testMergeSort() {
        let sortedNumbers = insertionList.sorted()
        Utils.test(algorithm: "Merge sort with list of \(insertionList.count) elements", closure: {
            XCTAssertEqual(sortedNumbers, Sort.mergeSort(array: insertionList))
        })
    }
}

// MARK: - BinarySearchTree

extension AlgorithmsTests {
    func testBinarySearchTreeDeletion() {
        let binarySearchTree = BinarySearchTree<Int>(array: [7,2,1,4,3,5,10,8,9,12,11,13])
        print(binarySearchTree.delete(value: 1))
        print(binarySearchTree)
    }
    
    func testBinarySearchTreeHeight() {
        let binarySearchTree = BinarySearchTree<Int>(array: [15,12,17,18,16,23,22,21,19,7,9,5,4,2])
        print(binarySearchTree.height())
    }
    
    func testBinarySearchTreePredecessor() {
        let binarySearchTree = BinarySearchTree<Int>(array: [7,2,10,1,5,9])
        print(binarySearchTree.predecessor())
    }
    
    func testIsBinarySearchTreeInValid() {
        let binarySearchTree = BinarySearchTree<Int>(array: [2,1,3])
        if let invalidTree = binarySearchTree.search(value: 1) {
            invalidTree.insert(value: 5)
            XCTAssertFalse(binarySearchTree.isBinarySearchTreeValid(minValue: Int.min, maxValue: Int.max))
        }
    }
}
