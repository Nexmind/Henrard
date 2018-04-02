//
//  Section.swift
//  henrard
//
//  Created by Julien Henrard on 19/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class Section {
    var type: SectionType = .none
    var title: String? = nil
    
    init(type: SectionType) {
        self.type = type
    }
    
    var image: UIImage? {
        return nil
    }
    
    func numberOfRows() -> Int {
        // To be implemented in subclass
        return 0
    }
    
    func cellFor(row: Int, in tableView: UITableView) -> UITableViewCell {
        // To be implemented in subclass
        return tableView.dequeueReusableCell(withIdentifier: "")!
    }
    
    func didSelect(indexPath: IndexPath, in tableView: UITableView) {
        // To be implemented in subclass
    }
    
    func heightForSection() -> CGFloat {
        return 50
    }
    func viewForSection() -> UIView? {
        let view = SectionHeaderView()
        view.set(with: self)
        return view
    }
    
    
}
