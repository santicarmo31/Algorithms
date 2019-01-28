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
    
    func testExample() {
        
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
    func testMergeSort2() {
        measure {
        let sortedNumbers = insertionList.sorted()
//        Utils.test(algorithm: "Merge sort with list of \(insertionList.count) elements", closure: {
            XCTAssertEqual(sortedNumbers, Sort.mergeSort(array: insertionList))
        }
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
        
// MARK: - BoyerMoore String

extension AlgorithmsTests {
    func testBoyerMooreString() {
        let testString = "Hello, World"
        let pattern = "World"
        XCTAssertEqual(testString.firstIndex(of: "W"), testString.index(of: pattern))
    }
}

// MARK: - Minimum or Maximum

extension AlgorithmsTests {
    func testMinimum() {
        let minimum = 0
        XCTAssertEqual(minimum, Search.minimum(insertionList))
    }
    
    func testMaximum() {
        let maximum = 9999999
        XCTAssertEqual(maximum, Search.maximum(insertionList))
    }
}

extension AlgorithmsTests {
    func testCountOcurrencesOf() {
        let countedOccurences = 1
        let key = 0
        XCTAssertEqual(countedOccurences, Search.countOcurrences(of: key, in: insertionList))
    }
}

// MARK: - LinkedList

extension AlgorithmsTests {
    func testLinkedListPush() {
        let linkedList = LinkedList<Int>()
        linkedList.push(value: 1)
        linkedList.push(value: 2)
        linkedList.push(value: 3)
        print(linkedList.description)
    }
    
    func testLinkedListAppend() {
        let linkedList = LinkedList<Int>()
        linkedList.append(value: 1)
        linkedList.append(value: 2)
        linkedList.append(value: 3)
        print(linkedList.description)
    }
    
    func testLinkedListNodeAt() {
        let linkedList = LinkedList<Int>()
        linkedList.append(value: 1)
        linkedList.append(value: 2)
        linkedList.append(value: 3)
        print(linkedList.node(at: 1)!.value)
        print(linkedList.description)
    }
    
    func testLinkedListInsertAfter() {
        let linkedList = LinkedList<Int>()
        linkedList.append(value: 1)
        linkedList.append(value: 2)
        linkedList.append(value: 3)
        print("Linked list before insert: " + linkedList.description)
        
        let after = linkedList.node(at: 1)!
        for _ in 0...2 {
            linkedList.insert(after: after, value: 5)
        }
        
        print("Linked list after insert: " + linkedList.description)
    }
    
    func testLinkedListPop() {
        let linkedList = LinkedList<Int>()
        linkedList.push(value: 1)
        linkedList.push(value: 2)
        linkedList.push(value: 3)
        print(linkedList.pop())
        print(linkedList.description)
    }
    
    func testLinkedListRemoveLast() {
        let list = LinkedList<Int>()
        list.push(value: 3)
        list.push(value: 2)
        list.push(value: 1)
        
        print("Before removing last node: \(list)")
        let removedValue = list.removeLast()
        
        print("After removing last node: \(list)")
        print("Removed value: " + String(describing: removedValue))
    }
    
    func testLinkedListRemoveAfter() {
        let list = LinkedList<Int>()
        list.push(value: 3)
        list.push(value: 2)
        list.push(value: 1)
        
        print("Before removing at particular index: \(list)")
        let index = 1
        let node = list.node(at: index - 1)!
        let removedValue = list.remove(after: node)
        
        print("After removing at index \(index): \(list)")
        print("Removed value: " + String(describing: removedValue))
    }
}
