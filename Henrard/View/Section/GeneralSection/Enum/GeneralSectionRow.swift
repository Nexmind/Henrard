//
//  GeneralSectionRow.swift
//  henrard
//
//  Created by Julien Henrard on 20/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import Foundation

enum GeneralSectionRowType {
    case name
    case age
    case description
    case philosophy
    case none
    
    static func build(with row: Int) -> GeneralSectionRowType {
        switch (row) {
            case 0: return .name
            case 1: return .age
            case 2: return .description
            case 3: return .philosophy
            default: return .none
        }
    }
    
    static var count: Int {
        return  GeneralSectionRowType.none.hashValue
    }
}
