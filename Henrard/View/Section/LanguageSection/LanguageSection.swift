//
//  LanguageSection.swift
//  henrard
//
//  Created by Julien Henrard on 22/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class LanguageSection: Section, SectionProtocol {
    
    var developerViewModel: DeveloperViewModel
    
    init(developerViewModel: DeveloperViewModel) {
        self.developerViewModel = developerViewModel
        super.init(type: .languages)
        self.title = "Languages"
    }
    
    // MARK: SectionProtocol
    override func numberOfRows() -> Int {
        return developerViewModel.languages.count
    }
    override func cellFor(row: Int, in tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LanguageCell.describe) as! LanguageCell
        cell.set(with: developerViewModel.languages[row])
        return cell
    }
}
