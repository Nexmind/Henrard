//
//  Skill.swift
//  henrard
//
//  Created by Julien Henrard on 18/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import Foundation

struct Skill: Decodable {
    var id: Int
    var title: String
    var description: String
    var technology: Technology
    var level: Level
    
    init() {
        self.id = 0
        self.title = ""
        self.description = ""
        self.technology = .none
        self.level = .none
    }
    
    init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = (try? values.decode(Int.self, forKey: .id)) ?? self.id
        self.title = (try? values.decode(String.self, forKey: .title)) ?? self.title
        self.description = (try? values.decode(String.self, forKey: .description)) ?? self.description
        self.technology = Technology.build(value: (try? values.decode(String.self, forKey: .technology)) ?? "")
        self.level = Level.build(value: (try? values.decode(String.self, forKey: .level)) ?? "")
    }
}
