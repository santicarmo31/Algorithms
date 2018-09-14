//
//  MinimunOrMaximum.swift
//  Algorithms
//
//  Created by Santiago Carmona Gonzalez on 9/14/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import Foundation

extension Search {
    static func minimum<T: Comparable>(_ array: [T]) -> T? {
        guard var minimum = array.first else {
            return nil
        }
        
        for element in array.dropFirst() {
            minimum = element < minimum ? element : minimum
        }
        return minimum
    }
    
   static func maximum<T: Comparable>(_ array: [T]) -> T? {
        guard var maximum = array.first else {
            return nil
        }
        
        for element in array.dropFirst() {
            maximum = element > maximum ? element : maximum
        }
        return maximum
    }
}
