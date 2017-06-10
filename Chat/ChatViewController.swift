//
//  ChatTableViewTableViewController.swift
//  
//
//  Created by Anna on 07.06.17.
//
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
        
    
    var channels = [[String:AnyObject]]()
    var channelsArray = [Channel]()             //6 items
    var usersArray = [[String:AnyObject]]()
    var namesArray = [String]()                 // 12 items
    var namesArraySixItems = [String]()         // only users you chat with
    var photosArray = [NSURL]()                 // 12 items
    var lastMessagesArray = [LastMessage]()     // 6 items
    var createDateArray = [String]()            // 6 items
    var textMessagesArray = [String]()          // 6 items
    var unreadMessagesCountArray = [Int]()      // 6 items [3, 1, 0, 0, 0, 0]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let nib = UINib(nibName: "ChatCell", bundle: nil)
        //tableView.register(nib, forCellReuseIdentifier: "ChatCell")
        
        self.tableView.reloadData()

        //JSON
        guard let path = Bundle.main.path(forResource: "chat", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            //print("JSON\n\(json)")
            let dict = json as! [String: AnyObject]
            //print(dict)
            
            let channels = dict["channels"] as! [[String:AnyObject]]
            //print(channels.count)
            
            for channel in channels {
                let newChannel = Channel(dictionary: channel)
                channelsArray.append(newChannel)
                //print(newChannel.user)
                for i in newChannel.user {
                    usersArray.append(i)
                }
                //print(newChannel.lastMessage)   // [], []
                let lastMessage = LastMessage(dictionary: newChannel.lastMessage)
                lastMessagesArray.append(lastMessage)
                unreadMessagesCountArray.append(newChannel.unreadMessageCount)
                
            }
            //print(channelsArray.count)
            //print(usersArray.count)
            //print(lastMessagesArray.count)
            //print(lastMessagesArray)
            //print(unreadMessagesCountArray.count)
            //print(unreadMessagesCountArray)
            
            //parse Users properties
            
            for i in usersArray {
                let user = User(dictionary: i)
                print(user)
                let name = "\(user.firstName) \(user.lastName)"
                namesArray.append(name)
                let photo = user.photo
                photosArray.append(photo)
                //print(name)
            }
            
            for i in lastMessagesArray {
                createDateArray.append(i.createDate)
                textMessagesArray.append(i.text)
            }
            
            for i in (0..<namesArray.count) {
                if i%2 == 0 {
                    namesArraySixItems.append(namesArray[i])
                }
            }
            
            //print(namesArray.count)
            //print(namesArray)
            //print(photosArray.count)
            //print(photosArray)
            //print(createDateArray.count)
            //print(createDateArray)
            //print(textMessagesArray.count)
            //print(textMessagesArray)
            //print(namesArraySixItems.count)
            //print(namesArraySixItems)

 
            
        }
        catch {
            print(error)
        }

    }

    


    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return channelsArray.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = tableView.dequeueReusableCell(withIdentifier: "PrototypeCell", for: indexPath) as! PrototypeCell
        
        let photoData = try? Data(contentsOf: photosArray[indexPath.row] as URL)
        cell.userpic.image = UIImage(data: photoData!)
        
        let userpic = UIImage(data: photoData!)
        let name = namesArraySixItems[indexPath.row]
        let lastMessage = textMessagesArray[indexPath.row]
        let time = createDateArray[indexPath.row]
        let unread = String(unreadMessagesCountArray[indexPath.row])
        
        
        cell.customInit(userpic: userpic!, nameLabel: name, lastMessageLabel: lastMessage, timeLabel: time, unreadLabel: unread)

        
        
        return cell
    }



}
