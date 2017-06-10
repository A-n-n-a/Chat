
import Foundation

struct Channel {
    var user: [[String:AnyObject]]
    var lastMessage: [String:AnyObject]
    var id: Int
    var unreadMessageCount: Int
    
    init(user: [[String:AnyObject]], lastMessage: [String:AnyObject], id: Int, unreadMessageCount: Int) {
        self.user = user
        self.lastMessage = lastMessage
        self.id = id
        self.unreadMessageCount = unreadMessageCount
    }
    
    init(dictionary: [String : AnyObject]) {
        self.user = dictionary["users"] as! [[String:AnyObject]]
        self.lastMessage = dictionary["last_message"] as! [String:AnyObject]
        self.id = dictionary["id"] as! Int
        self.unreadMessageCount = dictionary["unread_messages_count"] as! Int
    }
}
