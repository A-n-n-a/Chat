
import Foundation

struct User {
    
    // MARK: -
    // MARK: Properties
    
    let id: ID
    let username: String
    let firstName: String
    let lastName: String
    let photoUrl: NSURL
    let channels: [Channel]
}
