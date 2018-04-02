//
//  SkillSection.swift
//  henrard
//
//  Created by Julien Henrard on 21/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit
import MXParallaxHeader

class SkillSection: Section, SectionProtocol {

    var developerViewModel: DeveloperViewModel
    var parentScrollView: MXScrollView? = nil
    var parentViewController: UIViewController? = nil
    
    init(developerViewModel: DeveloperViewModel) {
        self.developerViewModel = developerViewModel
        super.init(type: .general)
        self.title = "Skills"
    }

    // MARK: SectionProtocol
    override func numberOfRows() -> Int {
        return 1
    }
    override func cellFor(row: Int, in tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SkillCell.describe) as! SkillCell
        cell.skillsViewModel = self.developerViewModel.skills
        cell.parentScrollView = self.parentScrollView
        cell.parentViewController = self.parentViewController
        return cell
    }
}
