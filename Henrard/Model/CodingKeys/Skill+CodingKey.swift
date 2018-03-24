//
//  Skill+CodingKey.swift
//  henrard
//
//  Created by Julien Henrard on 18/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import Foundation

extension Skill {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case technology
        case level
    }
}
