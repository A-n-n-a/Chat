//
//  TableViewCell.swift
//  Chat
//
//  Created by Anna on 10.06.17.
//  Copyright © 2017 Anna. All rights reserved.
//

import UIKit

public class TableViewCell: UITableViewCell {
    
    // MARK: -
    // MARK: Properties
    
    public override var reuseIdentifier: String? {
        return String(describing: type(of: self))
    }
}
