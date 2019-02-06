//
//  LinkedList.swift
//  Algorithms
//
//  Created by Santiago Carmona Gonzalez on 1/20/19.
//  Copyright © 2019 Santiago Carmona Gonzalez. All rights reserved.
//

import Foundation

struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    init() {
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    // MARK: - Insertion operations
    
    /// Also known as **head-first insertion**.
    /// Time complexity: **O(1)**
    mutating func push(value: Value) {
        copyNodes()
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    /// Also known as **tail-end insertion**
    /// Time complexity: **O(1)**
    mutating func append(value: Value) {
        copyNodes()
        guard !isEmpty else {
            push(value: value)
            return
        }
        
        tail?.next = Node(value: value)
        
        tail = tail?.next
    }
    
    /// Time complexity: **O(1)**
    mutating func insert(after node: Node<Value>, value: Value) {
        copyNodes()
        guard tail !== node else {
            append(value: value)
            return
        }
        
        node.next = Node(value: value, next: node.next)
    }
    
    // MARK: - Search operations
    
    /// Time complexity: **O(i)** where i is the index specified
    func node(at index: Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode = head
        
        while currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    // MARK: - Remove operations
    
    /// Time complexity: **O(1)**
    mutating func pop() -> Value? {
        copyNodes()
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
    
    /// Time complexity: **O(n)** because should traverse all elements
    mutating func removeLast() -> Value? {
        copyNodes()
        var currentNode = head
        
        guard currentNode !== tail else {
           return pop()
        }
        
        while currentNode?.next !== tail  {
            currentNode = currentNode?.next
        }
        
        let tailToRemove = self.tail
        currentNode?.next = nil
        tail = currentNode
        
        return tailToRemove?.value
    }
    
    /// Time complexity: **O(1)**
    mutating func remove(after node: Node<Value>) -> Value? {
        copyNodes()
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        
        return node.next?.value
    }        
    
    private mutating func copyNodes() {
        guard !isKnownUniquelyReferenced(&head) else {
            return
        }
        
        guard var oldNode = head else {
            return
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            
            oldNode = nextOldNode
        }
        
        tail = newNode
    }
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

extension LinkedList: Collection {
    
    public struct Index: Comparable {
        
        public var node: Node<Value>?
        
        static public func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
    
    // 1
    public var startIndex: Index {
        return Index(node: head)
    }
    // 2
    public var endIndex: Index {
        return Index(node: tail?.next)
    }
    // 3
    public func index(after i: Index) -> Index {
        return Index(node: i.node?.next)
    }
    // 4
    public subscript(position: Index) -> Value {
        return position.node!.value
    }
}
