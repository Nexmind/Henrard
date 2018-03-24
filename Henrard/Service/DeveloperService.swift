//
//  DeveloperService.swift
//  henrard
//
//  Created by Julien Henrard on 18/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import Foundation

class DeveloperService: Service {
    
    override init() {
        super.init()
    }
    
    func getBy(id: Int, completion: @escaping (Developer?, Int) -> Void) {
        ws.get("/developers/\(id)", headers: self.headers, timeOut: nil) { data, code in
            var developer: Developer? = nil
            if let data = data, code == 200 {
                developer = try? JSONDecoder().decode(Developer.self, from: data)
            }
            completion(developer, code)
        }
    }
}
