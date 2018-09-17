//
//  CountOcurrencesOf.swift
//  Algorithms
//
//  Created by Santiago Carmona gonzalez on 9/16/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import Foundation

extension Search {
    /**
     * the given items are already sorted, this is a variation of `BinarySearch` algorithm
     * where takes  **O(log n)** time to count the ocurrences of a key value.
     * This is because we look into the left
     * and right boundaries to determine where the key starts and ends.
     */
    static func countOcurrences<Type: Comparable>(of key: Type, in items: [Type]) -> Int {
        func leftBoundary() -> Int {
            var low = 0
            var high = items.count
            while low < high {
                let midIndex = low + (high - low)/2
                if items[midIndex] < key {
                    low = midIndex + 1
                } else {
                    high = midIndex
                }
            }
            return low
        }
        
        func rightBoundary() -> Int {
            var low = 0
            var high = items.count
            while low < high {
                let midIndex = low + (high - low)/2
                if items[midIndex] > key {
                    high = midIndex
                } else {
                    low = midIndex + 1
                }
            }
            return low
        }
        
        return rightBoundary() - leftBoundary()
    }
}
