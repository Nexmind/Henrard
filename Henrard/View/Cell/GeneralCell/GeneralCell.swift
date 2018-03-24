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
    
    
    // MARK: Variables
    var developerViewModel = DeveloperViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelTitle.textColor = UIColor.midnightBlue
        labelValue.textColor = UIColor.blackGrey
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
            break
            
        case .philosophy:
            self.labelTitle.text = "Philosophy"
            self.labelValue.text = developerViewModel.philosophy
            break
            
        default:
            break
        }
    }
}
