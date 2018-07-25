//
//  AlgorithmsTests.swift
//  AlgorithmsTests
//
//  Created by Santiago Carmona Gonzalez on 3/17/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import XCTest
@testable import Algorithms

class AlgorithmsTests: XCTestCase {
    
    var insertionList: [Int] = []
    
    override func setUp() {
        super.setUp()
        guard let list = load(jsonNamed: "list") as? [Int] else {
            fatalError()
        }
        
        insertionList = list
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func load(jsonNamed name: String) -> Any? {
        if let path = Bundle(for: AlgorithmsTests.self).path(forResource: name, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            } catch {
                print("Unable to find json file named: \(name)")
            }
        }
        
        return nil
    }
    
    func testInsertionSort() {
        let sortedNumbers = insertionList.sorted()
        Utils.test(algorithm: "Insertion sort", closure: {
            XCTAssertEqual(sortedNumbers, Sort.insertionSort([4,3,2,1]))
        })
    }
    
    func testInsertionSortWithoutSwap() {
        Utils.test(algorithm: "Insertion sort without swap", closure: {
            Sort.insertionSortWithoutSwap(insertionList)
        })
    }
}
