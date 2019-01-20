//
//  HackerRankTests.swift
//  AlgorithmsTests
//
//  Created by Santiago Carmona Gonzalez on 8/29/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import XCTest

class HackerRankTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {
            let applesThrownAtDistance = apples.map({ a + $0 })
            let orangesThrownAtDistance = oranges.map({ b + $0})
            print(applesThrownAtDistance.filter({  $0 >= s && $0 <= t }).count)
            print(orangesThrownAtDistance.filter({ $0 >= s && $0 <= t }).count)
        }
        countApplesAndOranges(s: 7, t: 10, a: 4, b: 12, apples: [2,3,-4], oranges: [3,-2,-4])
    }
    
    func testExampleKangaroo() {
        func testKangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
            let maximumJumpDistance = 10000
            let maximumStartPosition = 10000
            
            var kangaroo1Position = x1
            var kangaroo2Position = x2
            
            guard x1 >= 0 && x2 > x1 && x2 <= maximumStartPosition else {
                return "NO"
            }
            
            guard v1 >= 1 && v1 <= maximumJumpDistance else {
                return "NO"
            }
            
            guard v2 >= 1 && v2 <= maximumJumpDistance else {
                return "NO"
            }
            
            guard v2 < v1 else {
                return "NO"
            }
            
            while kangaroo2Position > kangaroo1Position {
                kangaroo1Position += v1
                kangaroo2Position += v2
                if kangaroo1Position == kangaroo2Position {
                    return "YES"
                }
            }
            
            return "NO"
        }
        print(testKangaroo(x1: 0, v1: 2, x2: 5, v2: 3))
    }
    
    func testBreakingRecords() {
        func breakingRecords(scores: [Int]) -> [Int] {
            var records: (best: Int, worst: Int) = (0, 0)
            
            guard let firstScore = scores.first else {
                return [0, 0]
            }
            
            var best = firstScore
            var worst = firstScore
            
            for game in 1..<scores.count {
                let score = scores[game]
                if score > best {
                    best = score
                    records.best += 1
                } else if score < worst {
                    worst = score
                    records.worst += 1
                }
            }
            
            return [records.best, records.worst]
        }
        print(breakingRecords(scores: [10,5,20,20,4,5,2,25,1]))
    }
    
    func testBirthdays() {
        func birthday(s: [Int], d: Int, m: Int) -> Int {
            return 1
        }
    }
}
