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
    var parentScrollView: MXScrollView? = nil
    var parentViewController: UIViewController? = nil
    
    init(developerViewModel: DeveloperViewModel) {
        self.developerViewModel = developerViewModel
    }

    // MARK: SectionProtocol
    func numberOfRows() -> Int {
        return 1
    }
    
    func cellFor(row: Int, in tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SkillCell.describe) as! SkillCell
        cell.skillsViewModel = self.developerViewModel.skills
        cell.parentScrollView = self.parentScrollView
        cell.parentViewController = self.parentViewController
        return cell
    }
    
    func titleForSection() -> String? {
        return "Skills"
    }
    
    func viewForSection() -> UIView? {
        let header = SectionHeaderView()
        header.set(with: self)
        return header
    }
    
    func heightForSection() -> CGFloat {
        return 50
    }
}
