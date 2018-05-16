//
//  MoreInfosPopUpController.swift
//  henrard
//
//  Created by Julien Henrard on 15/05/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class MoreInfosPopUpController: UIViewController, PopupContentViewController {
    
    // MARK: Outlets
    @IBOutlet weak var imageTechno1: UIImageView!
    @IBOutlet weak var imageTechno2: UIImageView!
    @IBOutlet weak var imageTechno3: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel1: UILabel!
    @IBOutlet weak var descriptionLabel2: UILabel!
    @IBOutlet weak var technoLabel: UILabel!
    @IBOutlet weak var exitLabel: UILabel!
    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var botBar: UIView!
    @IBOutlet weak var underTitleLine: UIView!
    @IBOutlet weak var contentView: UIView!
    
    
    var contentHeight: CGFloat = 0
    
    // MARK: Init and instance
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup() {
        self.imageTechno1.layer.cornerRadius = 4
        self.imageTechno2.layer.cornerRadius = 4
        self.imageTechno3.layer.cornerRadius = 4
        
        self.titleLabel.textColor = UIColor.midnightBlue
        
        self.descriptionLabel1.textColor = UIColor.wetAsphalt
        self.descriptionLabel2.textColor = UIColor.wetAsphalt
        
        self.underTitleLine.backgroundColor = UIColor.midnightBlue.withAlphaComponent(0.3)
        self.underTitleLine.round()
        
        self.separator.backgroundColor = UIColor.carrot.withAlphaComponent(0.5)
        self.separator.round()
        
        self.technoLabel.textColor = UIColor.pumpkin
        self.botBar.round()
        
        self.contentView.layer.cornerRadius = 8
        
        self.adaptUI()
    }
    
    class func instance() -> MoreInfosPopUpController {
        let storyboard = UIStoryboard(name: "PopUp", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: MoreInfosPopUpController.describe) as! MoreInfosPopUpController
        vc.loadViewIfNeeded()
        return vc
    }
    
    // MARK: Private methods
    private func adaptUI() {
        self.view.layoutIfNeeded()
        self.contentHeight = self.contentView.bounds.height + 24
    }
    
    
    // MARK: PopUpControllerDelegate
    func sizeForPopup(_ popupController: PopupController, size: CGSize, showingKeyboard: Bool) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: self.contentHeight)
    }
}
