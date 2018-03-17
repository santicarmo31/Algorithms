//
//  Stack.swift
//  Algorithms
//
//  Created by Santiago Carmona Gonzalez on 3/17/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import Foundation

public struct Stack<Type> {
    private var values: [Type]

    public init() {
        values = []
    }

    public mutating func push(value: Type) {
        values.append(value)
    }

    public mutating func pop() -> Type? {
        return values.popLast()
    }
}
