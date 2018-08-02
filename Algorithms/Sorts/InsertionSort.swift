//
//  InsertionSort.swift
//  Algorithms
//
//  Created by Santiago Carmona Gonzalez on 7/30/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import Foundation

// MARK: - Insertion Sort

extension Sort {
    
    /**
     * Worst case is O(n^2) because two nested loops
     *
     * - Note: This sort is stable because elements that have identical sort keys remain in the same relative order after sorting
     *
     */
    static func insertionSort<Type>(_ array: [Type], _ isOrderedBefore: (Type, Type) -> Bool) -> [Type] {
        var a = array
        for x in 1..<a.count {
            var y = x
            while y > 0 && isOrderedBefore(a[y], a[y - 1]) {
                a.swapAt(y - 1, y)
                y -= 1
            }
        }
        return a
    }
    
    /**
     * Worst case is O(n^2) because two nested loops
     *
     * - Note: This sort is stable because elements that have identical sort keys remain in the same relative order after sorting
     *
     */
    static func insertionSortWithoutSwap<Type>(_ array: [Type], _ isOrderedBefore: (Type, Type) -> Bool) -> [Type] {
        var a = array
        for x in 1..<a.count {
            var y = x
            let temp = a[y]
            while y > 0 && isOrderedBefore(temp, a[y - 1]) {
                a[y] = a[y - 1]
                y -= 1
            }
            a[y] = temp
        }
        return a
    }
}
