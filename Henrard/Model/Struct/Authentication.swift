//
//  Authentication.swift
//  henrard
//
//  Created by Julien Henrard on 5/05/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import Foundation

struct Authentication: Codable {
    var username: String
    var password: String
    var token: String
    var tokenType: String
    
    init() {
        // Hardcoded authentication for simple user on the api (readonly)
        self.username = Properties.apiUsername()
        self.password = Properties.apiPassword()
        
        self.token = ""
        self.tokenType = ""
    }
    
    var completeToken: String {
        return "\(self.tokenType) \(self.token)"
    }
    
    mutating func setToken(value: String, type: String) {
        self.token = value
        self.tokenType = type
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
    }
    
    init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.token = try values.decodeIfPresent(String.self, forKey: .id_token) ?? self.token
    }
}
