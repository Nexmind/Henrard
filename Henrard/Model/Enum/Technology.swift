//
//  Technology.swift
//  henrard
//
//  Created by Julien Henrard on 18/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import Foundation

enum Technology: String {
    case iOS = "IOS"
    case android = "ANDROID"
    case nodeJS = "NODEJS"
    case jhipster = "JHIPSTER"
    case angular = "ANGULAR"
    case git = "GIT"
    case aws = "AWS"
    case none = "NONE"

    static func build(value: String) -> Technology {
        switch(value) {
            case "IOS": return .iOS
            case "ANDROID": return .android
            case "NODEJS": return .nodeJS
            case "JHIPSTER": return .jhipster
            case "ANGULAR": return .angular
            case "AWS": return .aws
            case "GIT": return .git
            default: print("TECHNOLOGY ENUM: unknown value"); return .none
        }
    }
}
