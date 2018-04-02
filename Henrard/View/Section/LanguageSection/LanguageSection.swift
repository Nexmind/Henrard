//
//  LanguageSection.swift
//  henrard
//
//  Created by Julien Henrard on 22/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit
import AMPopTip

class LanguageSection: Section, SectionProtocol {

    var developerViewModel: DeveloperViewModel
    var parentViewController: UIViewController? = nil
    
    init(developerViewModel: DeveloperViewModel) {
        self.developerViewModel = developerViewModel
        super.init(type: .languages)
        self.title = "Languages"
    }

    // MARK: SectionProtocol
    override func numberOfRows() -> Int {
        return developerViewModel.languages.count
    }

    // MARK: Section Override
    override func cellFor(row: Int, in tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LanguageCell.describe) as! LanguageCell
        cell.set(with: developerViewModel.languages[row])
        return cell
    }

    override func didSelect(indexPath: IndexPath, in tableView: UITableView) {
        let cell = tableView.cellForRow(at: indexPath)
        let language = developerViewModel.languages[indexPath.row]

        if !language.comment.isEmpty, let parent = self.parentViewController, let frame = cell?.frame {
            let popTip = PopTip()
            popTip.bubbleColor = UIColor.wetAsphalt
            popTip.textColor = UIColor.cloud
            let newFrame = CGRect(x: frame.minX, y: frame.minY + self.heightForSection(), width: frame.width, height: frame.height)
            popTip.show(text: language.comment, direction: .up, maxWidth: CGFloat(200), in: parent.view, from: newFrame)
        }
    }
}
