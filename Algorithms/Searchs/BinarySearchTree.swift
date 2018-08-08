//
//  BinarySearchTree.swift
//  Algorithms
//
//  Created by Santiago Carmona Gonzalez on 8/2/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import Foundation

/**
 * Inserts a node always takes O(h) where h is the height of the tree
 *
 * A binary tree is balanced when its left and right subtrees contain roughly the same number of nodes
 *
 * - Note:
 *    1. The height of a **node** is the number of steps it takes to go from that node to its lowest leaf.
 *
 *    2. The height of the entire **tree** is the distance from the root to the lowest leaf
 */
class BinarySearchTree<Type: Comparable> {
    private(set) var value: Type
    private(set) var leftChild: BinarySearchTree?
    private(set) var rightChild: BinarySearchTree?
    private(set) var parent: BinarySearchTree?
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return leftChild == nil && rightChild == nil
    }
    
    public var hasLeftChild: Bool {
        return leftChild != nil
    }
    
    public var hasRightChild: Bool {
        return rightChild != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
    
    public var isLeftChild: Bool {
        return parent?.leftChild === self
    }
    
    public var isRightChild: Bool {
        return parent?.rightChild === self
    }
    
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
    
    public func search(value: Type) -> BinarySearchTree<Type>? {
        if value == self.value {
            return self
        }
        
        if value < self.value {
            if let leftChild = self.leftChild {
                return leftChild.search(value: value)
            }
        } else {
            if let rightChild = self.rightChild {
                return rightChild.search(value: value)
            }
        }
        
        return nil
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
    
    public func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(leftChild?.height() ?? 0, rightChild?.height() ?? 0)
        }
    }
    
    public func depth() -> Int {
        var node = self
        var edges = 0
        while let parent = node.parent {
            node = parent
            edges += 1
        }
        return edges
    }
    
    public func predecessor() -> BinarySearchTree<Type>? {
        if let left = leftChild {
         return left.maximum()
        } else {
            var node = self
            while let parent = node.parent {
                if parent.value < node.value {
                    return parent
                }
                node = parent
            }
            return nil
        }
    }
    
    public func sucessor() -> BinarySearchTree<Type>? {
        if let right = rightChild {
            return right.minimum()
        } else {
            var node = self
            while let parent = node.parent {
                if parent.value > node.value {
                    return parent
                }
                node = parent
            }
            return nil
        }
    }
    
    public func isBinarySearchTreeValid(minValue: Type, maxValue: Type) -> Bool {
        if value < minValue || value > maxValue {
            return false
        }
        let isLeftBinarySearchTreeValid = leftChild?.isBinarySearchTreeValid(minValue: minValue, maxValue: value) ?? true
        let  isRightBinarySearchTreeValid = rightChild?.isBinarySearchTreeValid(minValue: value, maxValue: maxValue) ?? true
        return isLeftBinarySearchTreeValid && isRightBinarySearchTreeValid
    }
    
    @discardableResult
    public func delete() -> BinarySearchTree<Type>? {
        var childToReplaceCurrentChild: BinarySearchTree?
        
        if let leftChild = self.leftChild {
            childToReplaceCurrentChild = leftChild.maximum()
        } else if let rightChild = self.rightChild {
            childToReplaceCurrentChild = rightChild.minimum()
        } else {
            childToReplaceCurrentChild = nil
        }
        
        childToReplaceCurrentChild?.delete()
        
        childToReplaceCurrentChild?.leftChild = self.leftChild
        childToReplaceCurrentChild?.rightChild = self.rightChild
        leftChild?.parent = childToReplaceCurrentChild
        rightChild?.parent = childToReplaceCurrentChild
        
        reconnectParentTo(childToReplaceCurrentChild)
        
        parent = nil
        leftChild = nil
        rightChild = nil
        return childToReplaceCurrentChild
    }
        
    public func delete(value: Type) -> BinarySearchTree<Type>? {
        if value == self.value {
            var childToReplaceCurrentChild: BinarySearchTree?
            
            if let leftChild = self.leftChild {
                childToReplaceCurrentChild = leftChild.maximum()
            } else if let rightChild = self.rightChild {
                childToReplaceCurrentChild = rightChild.minimum()
            } else {
                childToReplaceCurrentChild = nil
            }
            
            childToReplaceCurrentChild?.leftChild = self.leftChild
            childToReplaceCurrentChild?.rightChild = self.rightChild
            leftChild?.parent = childToReplaceCurrentChild
            rightChild?.parent = childToReplaceCurrentChild
            
            childToReplaceCurrentChild?.reconnectParentTo(nil)
            reconnectParentTo(childToReplaceCurrentChild)
            
            parent = nil
            leftChild = nil
            rightChild = nil
            return childToReplaceCurrentChild
        }
        
        if value < self.value {
            return leftChild?.delete(value: value)
        } else {
            return rightChild?.delete(value: value)
        }
    }
    
    private func reconnectParentTo(_ node: BinarySearchTree<Type>?) {
        if let parent = parent {
            if isLeftChild {
                parent.leftChild = node
            } else if isRightChild {
                parent.rightChild = node
            }
        }
        node?.parent = parent
    }
    
    private func maximum() -> BinarySearchTree<Type>? {
        var node = self
        while let next = node.rightChild {
            node = next
        }
        return node
    }
    
    private func minimum() -> BinarySearchTree<Type>? {
        var node = self
        while let next = node.leftChild {
            node = next
        }
        return node
    }
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = leftChild {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = rightChild {
            s += " -> (\(right.description))"
        }
        return s
    }
}
