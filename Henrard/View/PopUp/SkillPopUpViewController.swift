//
//  SkillPopUpViewController.swift
//  henrard
//
//  Created by Julien Henrard on 2/04/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class SkillPopUpViewController: UIViewController, PopupContentViewController {

    // MARK: Variables
    var skillViewModel: SkillViewModel!
    
    // MARK: Outlets
    @IBOutlet weak var imageSkill: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    var contentHeight: CGFloat = 0
    
    // MARK: Init and instance
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup() {
        self.imageSkill.clipsToBounds = true
        self.imageSkill.contentMode = .scaleAspectFit
        self.imageSkill.image = self.skillViewModel.logo
        
        self.titleLabel.textColor = UIColor.midnightBlue
        self.titleLabel.text = self.skillViewModel.textLevel
        
        self.descriptionLabel.textColor = UIColor.wetAsphalt
        self.descriptionLabel.text = self.skillViewModel.description
        
        self.contentView.layer.cornerRadius = 8
    }
    
    class func instance(skillViewModel: SkillViewModel) -> SkillPopUpViewController {
        let storyboard = UIStoryboard(name: "PopUp", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: SkillPopUpViewController.describe) as! SkillPopUpViewController
        vc.skillViewModel = skillViewModel
        vc.loadViewIfNeeded()
        vc.setup()
        vc.view.layoutIfNeeded()
        vc.contentHeight = vc.contentView.bounds.height + 8 // We adding the bottom marging
        return vc
    }
    
    // MARK: PopUpControllerDelegate
    func sizeForPopup(_ popupController: PopupController, size: CGSize, showingKeyboard: Bool) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: self.contentHeight)
    }
}
