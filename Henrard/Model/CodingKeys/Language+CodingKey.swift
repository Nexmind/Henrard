//
//  Language+CodingKey.swift
//  henrard
//
//  Created by Julien Henrard on 19/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import Foundation

extension Language {
    enum CodingKeys: String, CodingKey {
        case id
        case code
        case comment
        case level
    }
}
