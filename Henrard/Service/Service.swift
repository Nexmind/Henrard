//
//  Service.swift
//  henrard
//
//  Created by Julien Henrard on 18/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import Foundation

class Service {

    var ws: WebService
    var headers = [
        "Content-Type": "application/json",
        "Authorization": Session.shared.authentication.completeToken
    ]

    init() {
        self.ws = WebService(url: Properties.endpointUrl())
    }

    func authenticate(authentication: Authentication, completion: @escaping (Int, Bool) -> Void) {
        if let authData = (try? JSONEncoder().encode(authentication)) {
            self.ws.post("/authenticate", headers: self.headers, body: authData, timeOut: nil) { data, code in
                if let _ = data, code == 200 {
                    let newAuthentication = (try? JSONDecoder().decode(Authentication.self, from: data!))
                    if let newAuth = newAuthentication {
                        Session.shared.authentication.setToken(value: newAuth.token, type: "Bearer")
                        Session.shared.state = .active
                        completion(code, true)
                    } else {
                        completion(code, false)
                    }
                } else {
                    completion(code, false)
                }
            }
        } else {
            completion(0, false)
        }
    }
}
