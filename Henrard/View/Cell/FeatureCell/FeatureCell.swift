//
//  FeatureCell.swift
//  henrard
//
//  Created by Julien Henrard on 19/05/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class FeatureCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    var feature: Feature!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.textColor = UIColor.midnightBlue
        self.backgroundColor = UIColor.cloud
        self.separatorInset = UIEdgeInsetsMake(0, 0, 0, .greatestFiniteMagnitude)
    }
    
    func set(with feature: Feature) {
        self.feature = feature
        
        switch(feature) {
        case .coreML:
            self.titleLabel.text = "Core ML"
            self.logoImageView.image = #imageLiteral(resourceName: "core_ml")
        case .none:
            self.titleLabel.text = "Uknown type"
            self.logoImageView.image = nil
            break
        }
    }
}
