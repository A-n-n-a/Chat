//
//  LastMessage.swift
//  Chat
//
//  Created by Anna on 07.06.17.
//  Copyright © 2017 Anna. All rights reserved.
//

import Foundation

struct LastMessage {
    var createDate: String
    var sender: [String : AnyObject]
    var isRead: Bool
    var text: String
    
    init(createDate: String, sender: [String : AnyObject], isRead: Bool, text: String) {
        self.createDate = createDate
        self.sender = sender
        self.isRead = isRead
        self.text = text
    }
    
    init(dictionary: [String : AnyObject]) {
        self.createDate = dictionary["create_date"] as! String
        self.sender = dictionary["sender"] as! [String : AnyObject]
        self.isRead = dictionary["is_read"] as! Bool
        self.text = dictionary["text"] as! String
    }

}
