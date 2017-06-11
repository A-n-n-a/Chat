//
//  DispatchQueue+Extensions.swift
//  Chat
//
//  Created by Anna on 10.06.17.
//  Copyright © 2017 Anna. All rights reserved.
//

import Foundation

extension DispatchQueue {
    
    // MARK: -
    // MARK: Public
    
    public static func backgroundAsync<Result>(
        execute: @escaping () -> (Result),
        completion: @escaping (Result) -> ()
    ) {
        self.global(qos: .background).async {
            let result = execute()
            
            self.main.async {
                completion(result)
            }
        }
    }
    
}
