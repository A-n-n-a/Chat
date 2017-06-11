//
//  UITableView+Extensions.swift
//  Chat
//
//  Created by Anna on 10.06.17.
//  Copyright © 2017 Anna. All rights reserved.
//

import UIKit

extension UITableView {
    
    // MARK: -
    // MARK: Public
    
    public func reusableCell<T>(_ type: T.Type, indexPath: IndexPath, configure: (T) -> ()) -> UITableViewCell
        where T: UITableViewCell
    {
        let cell = self.dequeueReusableCell(withIdentifier: String(describing: type), for: indexPath)
        cast(cell).do(configure)
        
        return cell
    }
}
