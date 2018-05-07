//
//  GeneralSection.swift
//  henrard
//
//  Created by Julien Henrard on 20/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class GeneralSection: SectionProtocol {

    var developerViewModel: DeveloperViewModel

    init(developerViewModel: DeveloperViewModel) {
        self.developerViewModel = developerViewModel
    }

    // MARK: SectionProtocol
    func numberOfRows() -> Int {
        return GeneralSectionRowType.count
    }

    func cellFor(row: Int, in tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GeneralCell.describe) as! GeneralCell
        cell.selectionStyle = .none
        cell.set(with: self.developerViewModel, rowNumber: row)
        return cell
    }
    
    func didSelect(indexPath: IndexPath, in tableView: UITableView) {
        let cell = tableView.cellForRow(at: indexPath) as! GeneralCell
        cell.showOrHideMoreText()
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func heightForSection() -> CGFloat {
        return 0
    }
}
