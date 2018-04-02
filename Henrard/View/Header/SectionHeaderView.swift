//
//  SectionHeaderView.swift
//  henrard
//
//  Created by Julien Henrard on 1/04/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class SectionHeaderView: UIView {
    
    // MARK: Const
    let distanceImageToLabel: CGFloat = 8
    let widthImage: CGFloat = 35
    
    // MARK: Outlets
    @IBOutlet weak var labelSectionName: UILabel!
    @IBOutlet weak var imageSection: UIImageView!
    @IBOutlet weak var sectionLine: UIView!
    @IBOutlet weak var cstImageWidth: NSLayoutConstraint!
    @IBOutlet weak var cstImageToLabel: NSLayoutConstraint!
    @IBOutlet weak var cstHeightSectionLine: NSLayoutConstraint!
    
    // MARK: Variables
    var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.labelSectionName.textColor = UIColor.pumpkin
        self.sectionLine.backgroundColor = UIColor.carrot
        self.cstHeightSectionLine.constant = 0.8
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: SectionHeaderView.describe, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.backgroundColor = UIColor.cloud
        return view
    }
    
    func set(with section: Section) {
        self.labelSectionName.text = section.title
        self.imageSection.image = section.image
        
        if section.image == nil {
            self.cstImageWidth.constant = 0
            self.cstImageToLabel.constant = 0
        } else {
            self.cstImageWidth.constant = self.widthImage
            self.cstImageToLabel.constant = self.distanceImageToLabel
        }
    }
}
