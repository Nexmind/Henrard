//
//  SkillCollectionCell.swift
//  henrard
//
//  Created by Julien Henrard on 21/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class SkillCollectionCell: UICollectionViewCell {
    
    // MARK: Static variables
    static let itemHeight: CGFloat = 113
    static let itemWidth: CGFloat = 80
    
    // MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelLevel: UILabel!
    @IBOutlet weak var imageContentView: UIView!
    
    
    // MARK: Variables
    var skillViewModel = SkillViewModel()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(with skillViewModel: SkillViewModel) {
        self.skillViewModel = skillViewModel
        self.imageContentView.clipsToBounds = true
        self.imageContentView.border(color: UIColor.wetAsphalt, thickness: 2, round: true)
        self.imageView.image = skillViewModel.logo?.imageWithInsets(insets: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15))
        self.imageView.clipsToBounds = true
        self.imageView.backgroundColor = UIColor.white
        self.imageView.contentMode = .scaleAspectFit
        self.labelLevel.text = skillViewModel.textLevel
        self.labelLevel.textColor = skillViewModel.colorLevel
    }

}
