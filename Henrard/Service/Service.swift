//
//  Service.swift
//  henrard
//
//  Created by Julien Henrard on 18/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import Foundation

class Service {
    
    var ws : WebService
    var headers = [
        "Content-Type": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfVVNFUiIsImV4cCI6MTUyMzk4Nzg1MH0.kkIqul1sLw90WSFB7G5Heg4Vw3E-XVQ8PNHCrkaDIwQ4XNjjS76eJFpNaORp0r-O04Ymn1hOm_zERsNOtQHzog"
    ]
    
    init() {
        self.ws = WebService(url: Properties.endpointUrl())
    }
}
