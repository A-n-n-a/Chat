//
//  APIService.swift
//  Chat
//
//  Created by Anna on 10.06.17.
//  Copyright © 2017 Anna. All rights reserved.
//

import Foundation

class APIService {
    
    // MARK: -
    // MARK: Subtypes
    
    struct Strings {
        static let chat = "chat"
        static let json = "json"
    }
    
    struct Key {
        static let id = "id"
        static let channels = "channels"
        static let users = "users"
        static let lastMessage = "last_message"
        static let unreadMessagesCount = "unread_messages_count"
        static let firstName = "first_name"
        static let lastName = "last_name"
        static let photo = "photo"
        static let username = "username"
    }
    
    // MARK: -
    // MARK: Public
    
    public func user(completion: @escaping (User?) -> ()) {
        DispatchQueue.backgroundAsync(
            execute: {
                let users = toJSONArray(self.json(), Key.channels)
                    .first
                    .flatMap {
                        (toJSONArray($0, Key.users))
                            .flatMap(self.user)
                            .flattened()
                    }
                    ?? []
                
                return users.count > 1 ? users[1] : nil
            },
            completion: completion
        )
    } 
    
    public func channels(of user: User, completion: @escaping (User) -> ()) {
        DispatchQueue.backgroundAsync(
            execute: {
                let channels = toJSONArray(self.json(), Key.channels)
                    .flatMap(self.channel)
                    .flattened()
                
                return User(
                    id: user.id,
                    username: user.username,
                    firstName: user.firstName,
                    lastName: user.lastName,
                    photoUrl: user.photoUrl,
                    channels: channels
                )
            },
            completion: completion
        )
    }
    
    // MARK: -
    // MARK: Private
    
    private func channel(with json: JSON) -> Channel? {
        guard
            let id = toJSONID(json, Key.id),
            let user = toJSONArray(json, Key.users).first.flatMap(self.user),
//            let message = toJSON(json, Key.lastMessage).flatMap(self.message),
            let messageCount = toJSONInt(json, Key.unreadMessagesCount)
        else {
            return nil
        }
        
        return Channel(id: id, user: user, lastMessage: nil, unreadMessageCount: messageCount)
    }
    
    private func user(with json: JSON) -> User? {
        guard
            let id = toJSONID(json, Key.id),
            let photoUrl = NSURL(string: toJSONString(json, Key.photo))
        else {
            return nil
        }

        return User(
            id: id,
            username: toJSONString(json, Key.username),
            firstName: toJSONString(json, Key.firstName),
            lastName: toJSONString(json, Key.lastName),
            photoUrl: photoUrl,
            channels: []
        )
    }
    
    private func message(with json: JSON) -> Message? {
//        self.createDate = dictionary["create_date"] as! String
//        self.sender = dictionary["sender"] as! [String : AnyObject]
//        self.isRead = dictionary["is_read"] as! Bool
//        self.text = dictionary["text"] as! String
        return nil
    }
    
    private func json() -> JSON {
        return Bundle.main.path(forResource: Strings.chat, ofType: Strings.json)
            .map { URL(fileURLWithPath: $0) }
            .flatMap { try? Data(contentsOf: $0) }
            .flatMap { try? JSONSerialization.jsonObject(with: $0, options: .mutableContainers) }
            .flatMap(cast)
            ?? [:]
    }
}
