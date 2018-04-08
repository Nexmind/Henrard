//
//  SkillPopUpViewController.swift
//  henrard
//
//  Created by Julien Henrard on 2/04/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class DetailsPopUpViewController: UIViewController, PopupContentViewController {

    // MARK: Variables
    var skillViewModel: SkillViewModel? = nil
    var languageViewModel: LanguageViewModel? = nil

    // MARK: Outlets
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var contentView: UIView!

    var contentHeight: CGFloat = 0

    // MARK: Init and instance
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func set(with skill: SkillViewModel) {
        self.skillViewModel = skill
        if let skillViewModel = self.skillViewModel {
            self.image.clipsToBounds = true
            self.image.contentMode = .scaleAspectFit
            self.image.image = skillViewModel.logo

            self.titleLabel.textColor = UIColor.midnightBlue
            self.titleLabel.text = skillViewModel.name

            self.descriptionLabel.textColor = UIColor.wetAsphalt
            self.descriptionLabel.text = skillViewModel.description

            self.contentView.layer.cornerRadius = 8
        }
        
        self.adaptUI()
    }
    
    func set(with language: LanguageViewModel) {
        self.languageViewModel = language
        if let languageViewModel = self.languageViewModel {
            self.image.clipsToBounds = true
            self.image.contentMode = .scaleAspectFit
            self.image.image = languageViewModel.flag
            
            self.titleLabel.textColor = UIColor.midnightBlue
            self.titleLabel.text = languageViewModel.name
            
            self.descriptionLabel.textColor = UIColor.wetAsphalt
            self.descriptionLabel.text = languageViewModel.comment
            
            self.contentView.layer.cornerRadius = 8
        }
        
        self.adaptUI()
    }

    class func instance() -> DetailsPopUpViewController {
        let storyboard = UIStoryboard(name: "PopUp", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: DetailsPopUpViewController.describe) as! DetailsPopUpViewController
        vc.loadViewIfNeeded()
        return vc
    }
    
    // MARK: Private methods
    private func adaptUI() {
        self.view.layoutIfNeeded()
        self.contentHeight = self.contentView.bounds.height + 8
    }
    

    // MARK: PopUpControllerDelegate
    func sizeForPopup(_ popupController: PopupController, size: CGSize, showingKeyboard: Bool) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: self.contentHeight)
    }
}
