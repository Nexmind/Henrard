//
//  Language.swift
//  henrard
//
//  Created by Julien Henrard on 19/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import Foundation

enum LanguageCode: String {
    case french = "FRENCH"
    case english = "ENGLISH"
    case dutch = "SPANISH"
    case spanish = "DUTCH"
    case none = "NONE"
    
    static func build(value: String) -> LanguageCode {
        switch(value) {
        case "FRENCH": return .french
        case "ENGLISH": return .english
        case "SPANISH": return .dutch
        case "DUTCH": return .spanish
        default: print("LANGUAGE ENUM: unknown value"); return .none
        }
    }
}
