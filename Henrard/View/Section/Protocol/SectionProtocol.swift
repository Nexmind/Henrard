//
//  SectionProtocol.swift
//  henrard
//
//  Created by Julien Henrard on 20/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

protocol SectionProtocol {
    func numberOfRows() -> Int
    func cellFor(row: Int, in tableView: UITableView) -> UITableViewCell
}
