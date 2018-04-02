//
//  GeneralSection.swift
//  henrard
//
//  Created by Julien Henrard on 20/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class GeneralSection: Section, SectionProtocol {

    var developerViewModel: DeveloperViewModel

    init(developerViewModel: DeveloperViewModel) {
        self.developerViewModel = developerViewModel
        super.init(type: .general)
    }

    // MARK: SectionProtocol
    override func numberOfRows() -> Int {
        return GeneralSectionRowType.count
    }

    override func cellFor(row: Int, in tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GeneralCell.describe) as! GeneralCell
        cell.selectionStyle = .none
        cell.set(with: self.developerViewModel, rowNumber: row)
        return cell
    }
    
    override func heightForSection() -> CGFloat {
        return 0
    }
}
