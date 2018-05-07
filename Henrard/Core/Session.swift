//
//  Session.swift
//  henrard
//
//  Created by Julien Henrard on 5/05/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import Foundation

class Session {
    
    static let shared = Session()
    
    var state: SessionState = .inactive
    var authentication: Authentication = Authentication()
    
    private init() {
        self.setup()
    }
    
    func setup() {
        self.state = .inactive
        self.authentication = Authentication()
    }
}
