//
//  BinarySearch.swift
//  Algorithms
//
//  Created by Santiago Carmona Gonzalez on 7/31/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import Foundation

extension Search {
        
    // The given array is already sorted
    static func binarySearch<Type: Equatable & Comparable>(element: Type, in array: [Type], range: Range<Int>) -> Int? {
        
        if range.lowerBound >= range.upperBound {
            return nil
        }
        
        let index = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        let elementAtIndex = array[index]
        
        if element > elementAtIndex {
            return binarySearch(element: element, in: array, range: index + 1..<range.upperBound)
        } else if element < elementAtIndex{
            return binarySearch(element: element, in: array, range: range.lowerBound..<index)
        } else {
            return index
        }
        
    }
}
