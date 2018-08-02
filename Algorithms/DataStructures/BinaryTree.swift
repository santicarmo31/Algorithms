//
//  BinaryTree.swift
//  Algorithms
//
//  Created by Santiago Carmona Gonzalez on 8/2/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import Foundation

class BinaryTree {
    var leftChild: BinaryTree?
    var rightChild: BinaryTree?
    let value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    func insert(value: Int) {
        if value <= self.value {
            if leftChild == nil {
                leftChild = BinaryTree(value: value)
            } else {
                leftChild?.insert(value: value)
            }
        } else {
            if rightChild == nil {
                rightChild = BinaryTree(value: value)
            } else {
                rightChild?.insert(value: value)
            }
        }
    }
    
    func traverse() {
        print(leftChild?.traverse())
        print(value)
        print(rightChild?.traverse())
    }
    
}
