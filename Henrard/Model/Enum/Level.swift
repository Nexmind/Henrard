//
//  Level.swift
//  henrard
//
//  Created by Julien Henrard on 18/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import Foundation

enum Level: String {
    case basic = "BASIC"
    case medium = "MEDIUM"
    case senior = "SENIOR"
    case masterRace = "MASTER_RACE"
    case none = "NONE"

    static func build(value: String) -> Level {
        switch(value) {
        case "BASIC": return .basic
        case "MEDIUM": return .medium
        case "SENIOR": return .senior
        case "MASTER_RACE": return .masterRace
        default: print("LEVEL ENUM: unknown value"); return .none
        }
    }
}

extension Level: Equatable {
    static func > (lhs: Level, rhs: Level) -> Bool {
        if rhs == .basic {
            return true
        }

        if lhs == .masterRace {
            return true
        } else if lhs == .basic {
            return false
        }

        if lhs == .senior && rhs == .masterRace {
            return false
        } else if lhs == .medium && rhs == .senior {
            return false
        } else {
            return true
        }
    }
}
