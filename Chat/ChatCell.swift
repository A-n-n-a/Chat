//
//  ChatCell.swift
//  Chat
//
//  Created by Anna on 08.06.17.
//  Copyright © 2017 Anna. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var userpic: UIImageView!
   
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var unreadLabel: UILabel!
    
    func customInit(userpic: UIImage, nameLabel: String, lastMessageLabel: String, timeLabel: String, unreadLabel: String) {
        self.userpic.image = userpic
        self.nameLabel.text = nameLabel
        self.lastMessageLabel.text = lastMessageLabel
        self.timeLabel.text = timeLabel
        self.unreadLabel.text = unreadLabel
    }
}
