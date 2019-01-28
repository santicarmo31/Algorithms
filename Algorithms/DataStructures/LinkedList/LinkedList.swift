//
//  LinkedList.swift
//  Algorithms
//
//  Created by Santiago Carmona Gonzalez on 1/20/19.
//  Copyright © 2019 Santiago Carmona Gonzalez. All rights reserved.
//

import Foundation

class LinkedList<Value> {
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
    func push(value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    /// Also known as **tail-end insertion**
    /// Time complexity: **O(1)**
    func append(value: Value) {
        guard !isEmpty else {
            push(value: value)
            return
        }
        
        tail?.next = Node(value: value)
        
        tail = tail?.next
    }
    
    /// Time complexity: **O(1)**
    func insert(after node: Node<Value>, value: Value) {
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
    func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
    
    /// Time complexity: **O(n)** because should traverse all elements
    func removeLast() -> Value? {
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
    func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        
        return node.next?.value
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
