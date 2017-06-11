//
//  ChatAdapter.swift
//  Chat
//
//  Created by Anna on 10.06.17.
//  Copyright © 2017 Anna. All rights reserved.
//

import UIKit

enum ChatAdapterEvent {
    case didSelectChannel(Channel)
}

class ChatAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: -
    // MARK: Subtypes
    
    typealias ModelType = User
    typealias EventHandlerType = (ChatAdapterEvent) -> ()
    
    // MARK: -
    // MARK: Properties

    public let model: ModelType?
    public let eventHandler: EventHandlerType?
    public private(set) weak var tableView: UITableView?
    
    private var channels: [Channel] {
        return self.model?.channels ?? []
    }
    
    // MARK: -
    // MARK: Init and Deinit
    
    init(tableView: UITableView?, model: ModelType?, eventHandler: @escaping EventHandlerType) {
        self.model = model
        self.tableView = tableView
        self.eventHandler = eventHandler
        
        super.init()
        
        defer { self.tableView?.reloadData() }
    }
    
    // MARK: -
    // MARK: UITableViewDelegate
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.eventHandler?(.didSelectChannel(self.channels[indexPath.row]))
    }
    
    // MARK: -
    // MARK: UITableViewDataSource
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.channels.count
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.reusableCell(PrototypeCell.self, indexPath: indexPath) {
            $0.model = self.channels[indexPath.row]
        }
    }

}
