//
//  LanguageSection.swift
//  henrard
//
//  Created by Julien Henrard on 22/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class LanguageSection: SectionProtocol {

    var developerViewModel: DeveloperViewModel
    var parentViewController: UIViewController? = nil
    
    init(developerViewModel: DeveloperViewModel) {
        self.developerViewModel = developerViewModel
    }

    // MARK: SectionProtocol
    func numberOfRows() -> Int {
        return developerViewModel.languages.count
    }

    // MARK: Section Override
    func cellFor(row: Int, in tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LanguageCell.describe) as! LanguageCell
        cell.set(with: developerViewModel.languages[row])
        return cell
    }

    func didSelect(indexPath: IndexPath, in tableView: UITableView) {
        let language = developerViewModel.languages[indexPath.row]
        let vc = DetailsPopUpViewController.instance()
        vc.set(with: language)
        if let parent = self.parentViewController {
            PopupController
                .create(parent)
                .customize(
                    [
                        .animation(.slideUp),
                        .scrollable(true),
                        .backgroundStyle(.blackFilter(alpha: 0.7)),
                        .layout(.bottom)
                    ]
                )
                .didShowHandler { popup in
                    
                }
                .didCloseHandler { _ in
                    
                }
                .show(vc)
        }
    }
    
    func titleForSection() -> String? {
        return "Languages"
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
