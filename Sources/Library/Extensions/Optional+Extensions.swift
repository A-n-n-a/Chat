//
//  Optional+Extensions.swift
//  Chat
//
//  Created by Anna on 10.06.17.
//  Copyright © 2017 Anna. All rights reserved.
//

extension Optional {
    
    // MARK: -
    // MARK: Public
    
    public func `do`(_ execute: (Wrapped) -> ()) {
        self.map(execute)
    }
}
