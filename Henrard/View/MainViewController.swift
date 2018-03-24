//
//  ViewController.swift
//  henrard
//
//  Created by Julien Henrard on 18/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit
import MXParallaxHeader

class MainViewController: UIViewController, MXParallaxHeaderDelegate {

    let parallaxMinimumHeight: CGFloat = 80
    let parallaxHeight: CGFloat = 200
    var tableView: UITableView!
    var scrollView: MXScrollView!

    var developerViewModel = DeveloperViewModel()
    var headerView = MainHeaderView()

    var sections: [Section] = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.registerCells()
        
        self.scrollView = MXScrollView()
        self.scrollView.parallaxHeader.view = self.headerView
        self.scrollView.parallaxHeader.height = self.parallaxHeight
        self.scrollView.parallaxHeader.mode = .fill
        self.scrollView.parallaxHeader.minimumHeight = self.parallaxMinimumHeight
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(self.tableView)
        developerViewModel = DeveloperViewModel(byId: 1) {
            DispatchQueue.main.async {
                self.initSections()
                self.headerView.setWith(developerViewModel: self.developerViewModel)
                self.scrollView.parallaxHeader.delegate = self
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        var frame = view.frame

        scrollView.frame = frame
        scrollView.contentSize = frame.size

        frame.size.height -= scrollView.parallaxHeader.minimumHeight
        tableView.frame = frame
    }
    

    // MARK: Privates methods
    private func initSections() {
        self.sections.append(GeneralSection(developerViewModel: self.developerViewModel))
        self.sections.append(SkillSection(developerViewModel: self.developerViewModel))
        self.sections.append(LanguageSection(developerViewModel: self.developerViewModel))
    }
    
    private func registerCells() {
        self.tableView.register(UINib(nibName: GeneralCell.describe, bundle: nil), forCellReuseIdentifier: GeneralCell.describe)
        self.tableView.register(UINib(nibName: SkillCell.describe, bundle: nil), forCellReuseIdentifier: SkillCell.describe)
        self.tableView.register(UINib(nibName: LanguageCell.describe, bundle: nil), forCellReuseIdentifier: LanguageCell.describe)
    }

    // MARK: MXParallaxDelegate
    func parallaxHeaderDidScroll(_ parallaxHeader: MXParallaxHeader) {
        let headerHeight = parallaxHeader.contentView.bounds.height
        if headerHeight == parallaxMinimumHeight {
            self.headerView.imageProfile.alpha = 0
        } else if headerHeight >= parallaxHeight {
            self.headerView.imageProfile.alpha = 1
        } else {
            let startToDissapearAt: CGFloat = parallaxHeight
            let endToDissapearAt: CGFloat = parallaxMinimumHeight

            let range: CGFloat = startToDissapearAt - endToDissapearAt

            let advanceAlpha = 1 / range

            let advanceOfScroll = startToDissapearAt - headerHeight
            self.headerView.imageProfile.alpha = 1 - (advanceAlpha * advanceOfScroll)
        }
    }
}

