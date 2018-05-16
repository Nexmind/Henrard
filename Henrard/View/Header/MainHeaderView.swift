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
    @IBOutlet weak var opaqueView: UIView!
    @IBOutlet weak var backButton: UIButton!

    // MARK: Variables
    var view: UIView!
    var parentViewController: UIViewController? = nil
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

        self.opaqueView.backgroundColor = UIColor.midnightBlue
        self.opaqueView.alpha = 0.5
        self.imageProfile.clipsToBounds = true
        self.imageProfile.image = #imageLiteral(resourceName: "phProfilPicture")

        self.backButton.round()
        self.backButton.layer.borderColor = UIColor.pumpkin.cgColor
        self.backButton.layer.borderWidth = 1

        addSubview(view)
    }

    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: MainHeaderView.describe, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView

        return view
    }

    @IBAction func touchUpBackButton(_ sender: Any) {
        if let _ = self.parentViewController {
            self.parentViewController!.dismiss(animated: true, completion: {
                Session.shared.setup()
            })
        }
    }
}

