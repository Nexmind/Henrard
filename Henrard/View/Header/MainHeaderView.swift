//
//  MainHeaderView.swift
//  henrard
//
//  Created by Julien Henrard on 19/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit
import Kingfisher

class MainHeaderView: UIView {
    
    // MARK: Outlets
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSpeciality: UILabel!
    
    // MARK: Variables
    var view: UIView!
    var developerViewModel = DeveloperViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func setWith(developerViewModel: DeveloperViewModel) {
        self.developerViewModel = developerViewModel
        self.fillUI()
    }
    
    func fillUI() {
        self.labelName.text = developerViewModel.name
        self.imageProfile.kf.setImage(with: developerViewModel.pictureUrl)
        self.imageBackground.image = developerViewModel.bannerImage
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.imageProfile.clipsToBounds = true
        self.imageProfile.image = #imageLiteral(resourceName: "phProfilPicture")
        self.imageProfile.border(color: UIColor.gray, thickness: 1, round: true)
        
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: MainHeaderView.describe, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
}

