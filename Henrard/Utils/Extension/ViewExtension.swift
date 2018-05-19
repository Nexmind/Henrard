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
    
    /// Add dashed border to current UIView
    func addDashedBorder(strokeColor: UIColor, lineWidth: CGFloat, radius: CGFloat) {
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPattern = [6,3]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: radius).cgPath
        self.layer.cornerRadius = radius
        
        self.layer.addSublayer(shapeLayer)
    }
}
