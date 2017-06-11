//
//  Array+Extensions.swift
//  Chat
//
//  Created by Anna on 10.06.17.
//  Copyright © 2017 Anna. All rights reserved.
//

extension Array {
    
    // MARK: -
    // MARK: Public
    
    public func flattened<Unwrapped>() -> [Unwrapped]
        where Optional<Unwrapped> == Element
    {
        return self.flatMap { $0 }
    }
}
