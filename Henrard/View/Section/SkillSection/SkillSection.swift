//
//  SkillSection.swift
//  henrard
//
//  Created by Julien Henrard on 21/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class SkillSection: Section, SectionProtocol {

    var developerViewModel: DeveloperViewModel

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
        return cell
    }
}
