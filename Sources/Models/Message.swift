//
//  LastMessage.swift
//  Chat
//
//  Created by Anna on 07.06.17.
//  Copyright © 2017 Anna. All rights reserved.
//

struct Message {
    
    // MARK: -
    // MARK: Properties
    
    let creationDate: String
    let sender: User
    let text: String
    var isRead = false
}
