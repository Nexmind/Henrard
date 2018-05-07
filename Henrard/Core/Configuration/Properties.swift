//
//  Properties.swift
//  henrard
//
//  Created by Julien Henrard on 18/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import Foundation

class Properties {
    static let endpointUrl = { () -> String in
        let plistReader = PlistReader(plistFileName: "properties")
        let url = plistReader.getField(key: "wsUrl")
        return url!
    }
    
    static let apiUsername = { () -> String in
        let plistReader = PlistReader(plistFileName: "properties")
        let url = plistReader.getField(key: "apiUsername")
        return url!
    }
    static let apiPassword = { () -> String in
        let plistReader = PlistReader(plistFileName: "properties")
        let url = plistReader.getField(key: "apiPassword")
        return url!
    }
}
