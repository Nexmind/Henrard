//
//  ImageExtension.swift
//  henrard
//
//  Created by Julien Henrard on 19/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Round view if it's a square
    func round() {
        self.layer.cornerRadius = self.bounds.size.height / 2
    }
    
    /// Border the view, and optionnaly round it if it's a square
    func border(color: UIColor, thickness: CGFloat, round: Bool? = false) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = thickness
        
        if round! {
            self.round()
        }
    }
}
