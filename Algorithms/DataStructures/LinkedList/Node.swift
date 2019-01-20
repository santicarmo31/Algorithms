//
//  Node.swift
//  Algorithms
//
//  Created by Santiago Carmona Gonzalez on 1/20/19.
//  Copyright © 2019 Santiago Carmona Gonzalez. All rights reserved.
//

import Foundation

class Node<Value> {
    
    let value: Value
    var next: Node<Value>?
    
    init(value: Value, next: Node<Value>? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}
