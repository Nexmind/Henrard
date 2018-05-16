//
//  SectionCell.swift
//  henrard
//
//  Created by Julien Henrard on 16/05/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class SectionCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var separatorLine: UIView!
    @IBOutlet weak var cstheightSeparatorLine: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.separatorLine.backgroundColor = UIColor.carrot
        
        self.backgroundColor = UIColor.cloud
        self.separatorInset = UIEdgeInsetsMake(0, 0, 0, .greatestFiniteMagnitude)
        self.selectionStyle = .none
        self.cstheightSeparatorLine.constant = 0.8
        
    }
    
    func set(with title: String) {
        self.title.text = title
        self.title.textColor = UIColor.pumpkin
    }
}
