//
//  ContactSection.swift
//  henrard
//
//  Created by Julien Henrard on 14/05/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class ContactSection: SectionProtocol {
    
    var parentViewController: UIViewController? = nil
    
    func cellFor(row: Int, in tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.describe) as! ContactCell
        cell.parent = parentViewController
        return cell
    }
    
    func numberOfRows() -> Int {
        return 1
    }
    
    func typeForSection() -> SectionType {
        return .contact
    }
}
