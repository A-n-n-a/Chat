//
//  ChatTableViewTableViewController.swift
//  
//
//  Created by Anna on 07.06.17.
//
//

import UIKit

class ChatViewController: UIViewController {
    
    // MARK: -
    // MARK: Subtypes
    
    typealias ModelType = User
    typealias RootViewType = ChatView
    
    // MARK: -
    // MARK: Properties
    
    public var model: ModelType? {
        didSet { self.fill(with: model) }
    }
    
    public var rootView: RootViewType? {
        return cast(self.viewIfLoaded)
    }
    
    private let api = APIService()
    
    // MARK: -
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadModel()
        
        self.fill(with: self.model)
    }
    
    // MARK: -
    // MARK: Public
    
    public func fill(with model: ModelType?) {
        self.rootView?.model = model
    }
    
    // MARK: -
    // MARK: Private
    
    private func loadModel() {
        let api = self.api
        
        api.user {
            $0.do {
                api.channels(of: $0) {
                    self.model = $0
                }
            }
        }
    }
}
