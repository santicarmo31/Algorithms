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
    
    /// Also known as **head-first insertion**
    func push(value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    /// Also known as **tail-end insertion**
    func append(value: Value) {
        guard !isEmpty else {
            push(value: value)
            return
        }
        
        tail?.next = Node(value: value)
        
        tail = tail?.next
    }
    
    func insert(after node: Node<Value>, value: Value) {
        guard tail !== node else {
            append(value: value)
            return
        }
        
        node.next = Node(value: value, next: node.next)
    }
    
    func node(at index: Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode = head
        
        while currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
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
