//
//  SkillSection.swift
//  henrard
//
//  Created by Julien Henrard on 21/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit
import MXParallaxHeader

class SkillSection: SectionProtocol {

    var developerViewModel: DeveloperViewModel
    var parentScrollView: UIScrollView? = nil
    var parentViewController: UIViewController? = nil
    
    init(developerViewModel: DeveloperViewModel) {
        self.developerViewModel = developerViewModel
    }

    // MARK: SectionProtocol
    func numberOfRows() -> Int {
        return 1 + (isFirstRowSection() ? 1 : 0)
    }
    
    func cellFor(row: Int, in tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SkillCell.describe) as! SkillCell
        cell.skillsViewModel = self.developerViewModel.skills
        cell.parentScrollView = self.parentScrollView
        cell.parentViewController = self.parentViewController
        return cell
    }
    
    func typeForSection() -> SectionType {
        return .skills
    }
    
    func titleForSection() -> String? {
        return "Skills"
    }
    
    func isFirstRowSection() -> Bool {
        return true
    }
}
