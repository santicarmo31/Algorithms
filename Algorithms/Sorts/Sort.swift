//
//  Sort.swift
//  Algorithms
//
//  Created by Santiago Carmona Gonzalez on 7/24/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import Foundation

struct Sort {
}


// MARK: - Insertion Sort

/**
 * Worst case is O(n^2) because two nested loops
 *
 * This sort is stable because elements that have identical sort keys remain in the
 * same relative order after sorting
 */
extension Sort {
    static func insertionSort(_ array: [Int]) -> [Int] {
        var a = array
        for x in 1..<a.count {
            var y = x
            while y > 0 && a[y] < a[y - 1] {
                a.swapAt(y - 1, y)
                y -= 1
            }
        }
        return a
    }
    
    static func insertionSortWithoutSwap(_ array: [Int]) -> [Int] {
        var a = array
        for x in 1..<a.count {
            var y = x
            let temp = a[y]
            while y > 0 && temp < a[y - 1] {
                a[y] = a[y - 1]
                y -= 1
            }
            a[y] = temp
        }
        return a
    }
}
