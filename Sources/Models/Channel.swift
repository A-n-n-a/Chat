
struct Channel {
    
    // MARK: -
    // MARK: Properties
    
    let id: ID
    let user: User
    let lastMessage: Message?
    var unreadMessageCount = 0
}
