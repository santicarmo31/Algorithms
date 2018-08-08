//
//  MergeSort.swift
//  Algorithms
//
//  Created by Santiago Carmona Gonzalez on 8/8/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import Foundation

extension Sort {
    
    /**
     * Whether or not the array is sorted does not affect the speec since we are doing the same splits
     *
     * **Stable sort**: This means that array elements that have identical sort keys will stay in the same order relative to each other after sorting
     *
     * - Note:
     * 1. Time complexity for the best, worst and average case will always **O(n log n)**
     *
     * 2. A disadvantage of the merge-sort algorithm is that it needs a temporary "working" array equal in size to the array being sorted
     */
    static func mergeSort<Type: Comparable>(array: [Type]) -> [Type] {
        guard array.count > 1 else {
            return array
        }
        
        let middlefOfArray = array.count / 2
        
        let leftArray = mergeSort(array: Array(array[0..<middlefOfArray]))
        
        let rightArray = mergeSort(array: Array(array[middlefOfArray..<array.count]))
        
        return mergeAndSort(leftArray: leftArray, rightArray: rightArray)
    }
    
    private static func mergeAndSort<Type: Comparable>(leftArray: [Type], rightArray: [Type]) -> [Type] {
        var mergedArray: [Type] = []
        
        var leftIndex = 0
        var rightIndex = 0
        
        while leftIndex < leftArray.count && rightIndex < rightArray.count {
            if leftArray[leftIndex] < rightArray[rightIndex] {
                mergedArray.append(leftArray[leftIndex])
                leftIndex += 1
            } else if leftArray[leftIndex] > rightArray[rightIndex]{
                mergedArray.append(rightArray[rightIndex])
                rightIndex += 1
            } else {
                mergedArray.append(leftArray[leftIndex])
                leftIndex += 1
                mergedArray.append(rightArray[rightIndex])
                rightIndex += 1
            }
        }
        
        while leftIndex < leftArray.count {
            mergedArray.append(leftArray[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightArray.count {
            mergedArray.append(rightArray[rightIndex])
            rightIndex += 1
        }
        
        return mergedArray
    }
    
    // Bottom up
    
    static func mergeSortBottomUp<T>(_ a: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
        let n = a.count
        
        var z = [a, a]      // 1
        var d = 0
        
        var width = 1
        while width < n {   // 2
            
            var i = 0
            while i < n {     // 3
                
                var j = i
                var l = i
                var r = i + width
                
                let lmax = min(l + width, n)
                let rmax = min(r + width, n)
                
                while l < lmax && r < rmax {                // 4
                    if isOrderedBefore(z[d][l], z[d][r]) {
                        z[1 - d][j] = z[d][l]
                        l += 1
                    } else {
                        z[1 - d][j] = z[d][r]
                        r += 1
                    }
                    j += 1
                }
                while l < lmax {
                    z[1 - d][j] = z[d][l]
                    j += 1
                    l += 1
                }
                while r < rmax {
                    z[1 - d][j] = z[d][r]
                    j += 1
                    r += 1
                }
                
                i += width*2
            }
            
            width *= 2
            d = 1 - d      // 5
        }
        return z[d]
    }
}
