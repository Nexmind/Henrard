//
//  LanguageCell.swift
//  henrard
//
//  Created by Julien Henrard on 24/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class LanguageCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var labelLevel: UILabel!
    @IBOutlet weak var imageFlag: UIImageView!

    // MARK: Variables
    var languageViewModel = LanguageViewModel()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func set(with languageViewModel: LanguageViewModel) {
        self.languageViewModel = languageViewModel
        self.selectionStyle = .none
        self.labelLevel.text = languageViewModel.textLevel
        self.labelLevel.textColor = UIColor.peterRiver
        self.imageFlag.image = languageViewModel.flag
    }
}
