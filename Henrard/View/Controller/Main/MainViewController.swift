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

    let parallaxMinimumHeight: CGFloat = 85
    let parallaxHeight: CGFloat = 300
    var tableView: UITableView!
    var scrollView: MXScrollView!

    var developerViewModel = DeveloperViewModel()
    var headerView = MainHeaderView()

    var sections: [SectionProtocol] = [SectionProtocol]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView.init(frame: .zero, style: .plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.cloud
        self.tableView.tableFooterView = UIView()
        self.registerCells()

        self.scrollView = MXScrollView()
        self.scrollView.parallaxHeader.view = self.headerView
        self.scrollView.parallaxHeader.height = self.parallaxHeight
        self.scrollView.parallaxHeader.mode = .fill
        self.scrollView.parallaxHeader.minimumHeight = self.parallaxMinimumHeight
        self.scrollView.parallaxHeader.delegate = self
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(self.tableView)
        self.initSections()
        self.headerView.setWith(developerViewModel: self.developerViewModel)
        self.tableView.reloadData()
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
        
        let skillSection = SkillSection(developerViewModel: self.developerViewModel)
        skillSection.parentScrollView = self.scrollView
        skillSection.parentViewController = self
        self.sections.append(skillSection)
        
        let languageSection = LanguageSection(developerViewModel: self.developerViewModel)
        languageSection.parentViewController = self
        self.sections.append(languageSection)
    }

    private func registerCells() {
        self.tableView.register(UINib(nibName: GeneralCell.describe, bundle: nil), forCellReuseIdentifier: GeneralCell.describe)
        self.tableView.register(UINib(nibName: SkillCell.describe, bundle: nil), forCellReuseIdentifier: SkillCell.describe)
        self.tableView.register(UINib(nibName: LanguageCell.describe, bundle: nil), forCellReuseIdentifier: LanguageCell.describe)
    }

    // MARK: MXParallaxDelegate
    /// Alpha effect when scrolling ParallaxHeader
    func parallaxHeaderDidScroll(_ parallaxHeader: MXParallaxHeader) {
        let headerHeight = parallaxHeader.contentView.bounds.height
        if headerHeight == parallaxMinimumHeight {
            self.headerView.imageProfile.alpha = 0
            self.headerView.opaqueView.alpha = 1
        } else if headerHeight >= parallaxHeight {
            self.headerView.imageProfile.alpha = 1
            self.headerView.opaqueView.alpha = 0.5
        } else {
            let startToDissapearAt: CGFloat = parallaxHeight
            let endToDissapearAt: CGFloat = parallaxMinimumHeight * 1.7

            let range: CGFloat = startToDissapearAt - endToDissapearAt

            let advanceAlpha = 1 / range

            let advanceOfScroll = startToDissapearAt - headerHeight
            self.headerView.imageProfile.alpha = 1 - (advanceAlpha * advanceOfScroll)
            self.headerView.opaqueView.alpha = 0 + (advanceAlpha * advanceOfScroll) > 0.5 ? (advanceAlpha * advanceOfScroll) : 0.5
        }
    }
}

