//
//  BinarySearchTree.swift
//  Algorithms
//
//  Created by Santiago Carmona Gonzalez on 8/2/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import Foundation

class BinarySearchTree<Type: Comparable> {
    private(set) var value: Type
    private(set) var leftChild: BinarySearchTree?
    private(set) var rightChild: BinarySearchTree?
    private(set) var parent: BinarySearchTree?
    
    public init(value: Type) {
        self.value = value
    }
    
    public convenience init(array: [Type]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        
        for value in array.dropFirst() {
            insert(value: value)
        }
    }
    
    public func insert(value: Type) {
        if value < self.value {
            if let leftChild = self.leftChild {
                leftChild.insert(value: value)
            } else {
                leftChild = BinarySearchTree(value: value)
                leftChild?.parent = self
            }
        } else {
            if let rightChild = self.rightChild {
                rightChild.insert(value: value)
            } else {
                rightChild = BinarySearchTree(value: value)
                rightChild?.parent = self
            }
        }
    }
    
    public func traverseInOrder() {
        leftChild?.traverseInOrder()
        print(value)
        rightChild?.traverseInOrder()
    }
    
    public func traversePreOrder() {
        print(value)
        leftChild?.traversePreOrder()
        rightChild?.traversePreOrder()
    }
    
    public func traversePostOrder() {
        leftChild?.traversePostOrder()
        rightChild?.traversePostOrder()
        print(value)
    }
}
