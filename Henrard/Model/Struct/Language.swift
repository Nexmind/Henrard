//
//  Language.swift
//  henrard
//
//  Created by Julien Henrard on 19/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import Foundation

struct Language: Decodable {
    var id: Int
    var code: LanguageCode
    var comment: String
    var level: Level
    
    init() {
        self.id = 0
        self.code = .none
        self.comment = ""
        self.level = .none
    }
    
    init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = (try? values.decode(Int.self, forKey: .id)) ?? self.id
        self.code = LanguageCode.build(value: (try? values.decode(String.self, forKey: .code)) ?? "")
        self.comment = (try? values.decode(String.self, forKey: .comment)) ?? self.comment
        self.level = Level.build(value: (try? values.decode(String.self, forKey: .level)) ?? "")
    }
}
