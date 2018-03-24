//
//  Developer+CodingKeys.swift
//  henrard
//
//  Created by Julien Henrard on 18/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import Foundation

extension Developer {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case philosophy
        case age
        case picture
        case speciality
        case skills
        case languages
    }
}
