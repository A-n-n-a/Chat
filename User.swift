
import Foundation

struct User {
    var lastName: String
    var id: Int
    var photo: NSURL
    var userName: String
    var firstName: String
    
    init(lastName: String, id: Int, photo: NSURL, userName: String, firstName: String) {
        self.lastName = lastName
        self.id = id
        self.photo = photo
        self.userName = userName
        self.firstName = firstName
    }
    init(dictionary: [String : AnyObject]) {
        self.lastName = dictionary["last_name"] as! String
        self.id = dictionary["id"] as! Int
        self.photo = NSURL(string: dictionary["photo"] as! String)!
        self.userName = dictionary["username"] as! String
        self.firstName = dictionary["first_name"] as! String
    }
}
