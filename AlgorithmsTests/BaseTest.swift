//
//  BaseTest.swift
//  AlgorithmsTests
//
//  Created by Santiago Carmona Gonzalez on 7/30/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import XCTest

class BaseTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
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
}
