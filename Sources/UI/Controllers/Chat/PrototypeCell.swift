//
//  PrototypeCell.swift
//  Chat
//
//  Created by Anna on 09.06.17.
//  Copyright © 2017 Anna. All rights reserved.
//

import UIKit

class PrototypeCell: TableViewCell {

    // MARK: -
    // MARK: Subtypes
    
    typealias ModelType = (Channel)
    
    // MARK: -
    // MARK: Properties
    
    @IBOutlet var userpicImageView: UIImageView?
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var lastMessageLabel: UILabel?
    
    @IBOutlet var timeLabel: UILabel?
    @IBOutlet var unreadLabel: UILabel?
    
    var model: ModelType? {
        didSet { self.fill(with: model) }
    }
    
    // MARK: -
    // MARK: Public
    
    public func fill(with model: ModelType?) {
        let user = model?.user
        self.nameLabel?.text = "\(user?.firstName ?? "") \(user?.lastName ?? "")"
        
        let message = model?.lastMessage
        self.lastMessageLabel?.text = message?.text
        self.timeLabel?.text = message?.creationDate
        
        self.unreadLabel?.text = "\(model?.unreadMessageCount ?? 0)"
        
        weak var weak = self
        
        let shouldLoad = { weak?.model?.id == model?.id }
        
        DispatchQueue.backgroundAsync(
            execute: { () -> UIImage? in
                let url = shouldLoad() ? model?.user.photoUrl : nil
                
                return url
                    .flatMap { try? Data(contentsOf: $0 as URL) }
                    .flatMap(UIImage.init)
            },
            completion: {
                if shouldLoad() {
                    weak?.userpicImageView?.image = $0
                }
            }
        )
//        self.userpic.image = userpic
    }
}
