//
//  MainViewController+tableView.swift
//  henrard
//
//  Created by Julien Henrard on 19/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        if let title = section.titleForSection?(), section.isFirstRowSection?() ?? false, indexPath.row == 0 {
            let sectionCell = tableView.dequeueReusableCell(withIdentifier: SectionCell.describe) as! SectionCell
            sectionCell.set(with: title)
            return sectionCell
        }
        return section.cellFor(row: indexPath.row, in: tableView)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = self.sections[indexPath.section]
        if section.typeForSection() == .skills && section.isFirstRowSection?() ?? false && indexPath.row > 0  {
            return SkillCollectionCell.itemHeight + 10
        }
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].titleForSection?() ?? nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sections[section].heightForSection?() ?? 0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sections[section].viewForSection?() ?? nil
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sections[indexPath.section].didSelect?(indexPath: indexPath, in: tableView)
    }
}
