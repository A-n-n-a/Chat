//
//  ID.swift
//  Chat
//
//  Created by Anna on 10.06.17.
//  Copyright © 2017 Anna. All rights reserved.
//

struct ID {
    let value: Int
    
    init(_ value: Int) {
        self.value = value
    }
}

extension ID: Equatable { }

func ==(lhs: ID, rhs: ID) -> Bool {
    return lhs.value == rhs.value
}

extension ID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(value)
    }
}

func toID(_ value: Int) -> ID {
    return ID(value)
}
