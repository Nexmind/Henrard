//
//  MXScrollContainerController.swift
//  henrard
//
//  Created by Julien Henrard on 23/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit
import MXParallaxHeader

class MXScrollContainerController: MXScrollViewController {
    
    var header = MainHeaderView()
    var developerViewModel = DeveloperViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        developerViewModel = DeveloperViewModel(byId: 1) {
            DispatchQueue.main.async {
                self.header.setWith(developerViewModel: self.developerViewModel)
                self.scrollView.parallaxHeader.view = self.header
            }
        }
    }
    
}
