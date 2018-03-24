//
//  Developer.swift
//  henrard
//
//  Created by Julien Henrard on 18/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import Foundation

struct Developer: Decodable {
    var id: Int
    var name: String
    var description: String
    var philosophy: String
    var age: Int
    var picture: String
    var speciality: Technology
    var skills: [Skill]
    var languages: [Language]
    
    init() {
        self.id = 0
        self.name = ""
        self.description = ""
        self.philosophy = ""
        self.age = 0
        self.picture = ""
        self.speciality = .none
        self.skills = [Skill]()
        self.languages = [Language]()
    }

    init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = (try? values.decode(Int.self, forKey: .id)) ?? self.id
        self.name = (try? values.decode(String.self, forKey: .name)) ?? self.name
        self.description = (try? values.decode(String.self, forKey: .description)) ?? self.description
        self.philosophy = (try? values.decode(String.self, forKey: .philosophy)) ?? self.philosophy
        self.age = (try? values.decode(Int.self, forKey: .age)) ?? self.age
        self.picture = (try? values.decode(String.self, forKey: .picture)) ?? self.picture
        self.speciality = Technology.build(value: (try? values.decode(String.self, forKey: .speciality)) ?? "")
        self.skills = (try? values.decode([Skill].self, forKey: .skills)) ?? self.skills
        self.languages = (try? values.decode([Language].self, forKey: .languages)) ?? self.languages
    }
}
