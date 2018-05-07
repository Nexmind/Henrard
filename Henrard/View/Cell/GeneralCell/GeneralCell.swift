//
//  GeneralCell.swift
//  henrard
//
//  Created by Julien Henrard on 20/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class GeneralCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var chevron: UIImageView!

    @IBOutlet weak var cstChevronToRight: NSLayoutConstraint!
    @IBOutlet weak var cstWidthChevron: NSLayoutConstraint!
    @IBOutlet weak var cstHeightChevron: NSLayoutConstraint!

    // MARK: Variables
    var developerViewModel = DeveloperViewModel()
    var isExpanded = false

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.cloud
        labelTitle.textColor = UIColor.midnightBlue
        labelValue.textColor = UIColor.blackGrey
        self.chevron.tintColor = UIColor.pumpkin
        self.hideChevron()
    }

    func showOrHideMoreText() {
        if !self.chevron.isHidden {
            let angle: CGFloat = self.isExpanded ? (.pi / 2) * -1 : .pi / 2
            self.labelValue.numberOfLines = self.isExpanded ? 3 : 0
            UIView.animate(withDuration: 0.3, animations: {
                self.chevron.transform = self.chevron.transform.rotated(by: angle)
            })

            self.isExpanded = !self.isExpanded
        }
    }

    private func showChevron() {
        self.cstChevronToRight.constant = 12
        self.cstWidthChevron.constant = 12
        self.cstHeightChevron.constant = 12
        self.chevron.isHidden = false
    }

    private func hideChevron() {
        self.cstChevronToRight.constant = 0
        self.cstWidthChevron.constant = 0
        self.cstHeightChevron.constant = 0
        self.chevron.isHidden = true
    }

    func set(with developerViewModel: DeveloperViewModel, rowNumber: Int) {
        self.developerViewModel = developerViewModel
        let enumRow = GeneralSectionRowType.build(with: rowNumber)
        switch (enumRow) {
        case .name:
            self.labelTitle.text = "Name"
            self.labelValue.text = developerViewModel.name
            break

        case .age:
            self.labelTitle.text = "Age"
            self.labelValue.text = developerViewModel.age
            break

        case .description:
            self.labelTitle.text = "Description"
            self.labelValue.text = developerViewModel.description
            self.showChevron()
            break

        case .philosophy:
            self.labelTitle.text = "Philosophy"
            self.labelValue.text = developerViewModel.philosophy
            self.showChevron()
            break

        default:
            break
        }
    }
}
