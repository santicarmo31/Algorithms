//
//  Queue.swift
//  Algorithms
//
//  Created by Santiago Carmona Gonzalez on 3/17/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import Foundation

public struct Queue<Type> {
    private var values: [Type?] = []
    private var head: Int = 0

    public init() {
    }
    
    public mutating func enqueue(value: Type) {
        values.append(value)
    }

    public mutating func dequeueSlowly() -> Type? {
        return values.isEmpty ? nil : values.removeFirst()
    }

    /**
     * Sets empty space on the dequeueing value to avoid shifting the values after removerFirst.
     *
     * After setting a minimun of items to `nil we use the `removeFirst()` function to trimmed the queue
     *
     *     [nil, nil, "Tim", "Grace"]
     *
     */
    public mutating func dequeue() -> Type? {

        guard head < values.count, let value = values[head] else {
            return nil
        }

        values[head] = nil
        head += 1

        let percentage = Double(head)/Double(values.count)
        if values.count > 100 && percentage > 0.25 {
            values.removeFirst(head)
            head = 0
        }

        return value
    }
}

