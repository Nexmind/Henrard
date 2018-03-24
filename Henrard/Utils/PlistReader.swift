//
//  PlistReader.swift
//  henrard
//
//  Created by Julien Henrard on 18/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import Foundation

public class PlistReader {
    
    var hmDict : NSDictionary?
    
    public init(plistFileName : String){
        if let path = Bundle.main.path(forResource: plistFileName, ofType: "plist")
        {
            hmDict = NSDictionary(contentsOfFile: path)
        }
    }
    
    public func getField(key : String) -> String?{
        if let dict = hmDict {
            return (dict[key] as? String)!
        }
        return nil
    }
    
}
