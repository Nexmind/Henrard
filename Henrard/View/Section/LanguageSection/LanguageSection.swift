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
        return developerViewModel.languages.count + (isFirstRowSection() ? 1 : 0)
    }

    // MARK: Section Override
    func cellFor(row: Int, in tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LanguageCell.describe) as! LanguageCell
        cell.set(with: developerViewModel.languages[row - (isFirstRowSection() ? 1 : 0)])
        return cell
    }

    func didSelect(indexPath: IndexPath, in tableView: UITableView) {
        if indexPath.row > 0 {
            let language = developerViewModel.languages[indexPath.row - (isFirstRowSection() ? 1 : 0)]
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
    }

    func titleForSection() -> String? {
        return "Languages"
    }

    func typeForSection() -> SectionType {
        return .languages
    }

    func isFirstRowSection() -> Bool {
        return true
    }
}
