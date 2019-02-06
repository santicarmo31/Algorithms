//
//  LinkedListChallenges.swift
//  Algorithms
//
//  Created by Santiago Carmona Gonzalez on 2/4/19.
//  Copyright © 2019 Santiago Carmona Gonzalez. All rights reserved.
//

import Foundation

struct LinkedListChallenges {
    static func traversePostOrder<Value>(_ list: LinkedList<Value>) {        
        print(list.reversed())
    }
    
    static func returnMiddleNodeOf<Value>(_ list: LinkedList<Value>) -> Node<Value>? {
        let middleIndex = list.count / 2
        return list.node(at: middleIndex)
    }
    
    static func merge<Value: Comparable>(sortedList list1: LinkedList<Value>, withSorted list2: LinkedList<Value>) -> LinkedList<Value> {
        let sortedValues = (Array(list1) + Array(list2)).sorted(by: <)
        
        var mergeList = LinkedList<Value>()
        for value in sortedValues {
            mergeList.append(value: value)
        }
        
        return mergeList
    }
}

extension LinkedList {
    mutating func reverse() {
        let reverseValues = self.reversed()
        head = nil
        tail = nil
        
        for value in reverseValues {
            append(value: value)
        }
    }
    
    mutating func removeOcurrences(of: Value) {
        
    }
}
