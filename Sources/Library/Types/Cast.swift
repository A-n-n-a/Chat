//
//  Cast.swift
//  Chat
//
//  Created by Anna on 10.06.17.
//  Copyright © 2017 Anna. All rights reserved.
//

import Foundation

public func cast<Value, Result>(_ value: Value) -> Result? {
    return value as? Result
}
