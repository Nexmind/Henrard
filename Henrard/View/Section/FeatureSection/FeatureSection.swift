//
//  FeatureSection.swift
//  henrard
//
//  Created by Julien Henrard on 19/05/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class FeatureSection: SectionProtocol {

    var parentViewController: UIViewController? = nil

    func numberOfRows() -> Int {
        return 1 + (isFirstRowSection() ? 1 : 0)
    }

    func cellFor(row: Int, in tableView: UITableView) -> UITableViewCell {
        if row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FeatureCell.describe) as! FeatureCell
            cell.set(with: .coreML)
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func typeForSection() -> SectionType {
        return .features
    }

    func isFirstRowSection() -> Bool {
        return true
    }

    func titleForSection() -> String? {
        return "Features"
    }

    func didSelect(indexPath: IndexPath, in tableView: UITableView) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row > 0 {
            let cell = tableView.cellForRow(at: indexPath) as! FeatureCell
            switch (cell.feature) {
            case .coreML:
                let storyboard = UIStoryboard(name: "Feature", bundle: nil)
                if #available(iOS 11.0, *) {
                    let vc = storyboard.instantiateViewController(withIdentifier: CoreMLViewController.describe)
                    (self.parentViewController as? MainViewController)?.navigationController?.pushViewController(vc, animated: true)
                } else {
                    //
                }
                break
            case .none:
                break
            default:
                break
            }
        }
    }

}
