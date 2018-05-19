//
//  SectionProtocol.swift
//  henrard
//
//  Created by Julien Henrard on 20/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

@objc protocol SectionProtocol {
    func numberOfRows() -> Int
    func cellFor(row: Int, in tableView: UITableView) -> UITableViewCell
    func typeForSection() -> SectionType
    @objc optional func viewForSection() -> UIView?
    @objc optional func didSelect(indexPath: IndexPath, in tableView: UITableView)
    @objc optional func titleForSection() -> String?
    @objc optional func heightForSection() -> CGFloat
    @objc optional func isFirstRowSection() -> Bool
}

extension SectionProtocol {
    var image: UIImage? {
        return nil
    }
}
