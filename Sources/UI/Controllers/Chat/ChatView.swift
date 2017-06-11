//
//  ChatView.swift
//  Chat
//
//  Created by Anna on 10.06.17.
//  Copyright © 2017 Anna. All rights reserved.
//

import UIKit

enum ChatViewEvent {
    case didSelectChannel(Channel)
}

class ChatView: UIView {

    // MARK: -
    // MARK: Subtypes
    
    typealias ModelType = User
    typealias EventHandlerType = (ChatViewEvent) -> ()
    
    // MARK: -
    // MARK: Properties
    
    @IBOutlet weak var tableView: UITableView?
    
    public var eventHandler: EventHandlerType?
    
    public var model: ModelType? {
        didSet { self.fill(with: model) }
    }
    
    private var adapter: ChatAdapter? {
        didSet {
            let tableView = self.tableView
            tableView?.delegate = adapter
            tableView?.dataSource = adapter
        }
    }

    // MARK: -
    // MARK: Public
    
    public func fill(with model: ModelType?) {
        self.adapter = ChatAdapter(tableView: self.tableView, model: model) {
            switch $0 {
            case let .didSelectChannel(channel): self.eventHandler?(.didSelectChannel(channel))
            }
        }
    }
}
