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
    
    static let navigationControllerIdentifier = "MainNavigationController"
    
    @IBOutlet weak var tableView: UITableView!

    let parallaxMinimumHeight: CGFloat = Display.typeIsLike == .iphoneX ? 120 : 100
    let parallaxHeight: CGFloat = 300

    var developerViewModel = DeveloperViewModel()
    var headerView = MainHeaderView()

    var sections: [SectionProtocol] = [SectionProtocol]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.midnightBlue
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.midnightBlue
        self.tableView.estimatedRowHeight = 50
        
        self.tableView.autoresizingMask = .init(rawValue: 0)
        self.registerCells()
        
        self.headerView.parentViewController = self

        self.tableView.parallaxHeader.view = self.headerView
        self.tableView.parallaxHeader.height = self.parallaxHeight
        self.tableView.parallaxHeader.minimumHeight = self.parallaxMinimumHeight
        self.tableView.parallaxHeader.mode = .fill
        self.tableView.parallaxHeader.delegate = self
        
        self.tableView.tableFooterView = UIView()
        
        self.initSections()
        self.headerView.setWith(developerViewModel: self.developerViewModel)
        self.tableView.reloadData()
    }


    // MARK: Privates methods
    private func initSections() {
        self.sections.append(GeneralSection(developerViewModel: self.developerViewModel))
        
        let skillSection = SkillSection(developerViewModel: self.developerViewModel)
        skillSection.parentScrollView = self.tableView
        skillSection.parentViewController = self
        self.sections.append(skillSection)
        
        let languageSection = LanguageSection(developerViewModel: self.developerViewModel)
        languageSection.parentViewController = self
        self.sections.append(languageSection)
        
        let featureSection = FeatureSection()
        featureSection.parentViewController = self
        self.sections.append(featureSection)
        
        let contactSection = ContactSection()
        contactSection.parentViewController = self
        self.sections.append(contactSection)
    }

    private func registerCells() {
        self.tableView.register(UINib(nibName: GeneralCell.describe, bundle: nil), forCellReuseIdentifier: GeneralCell.describe)
        self.tableView.register(UINib(nibName: SkillCell.describe, bundle: nil), forCellReuseIdentifier: SkillCell.describe)
        self.tableView.register(UINib(nibName: LanguageCell.describe, bundle: nil), forCellReuseIdentifier: LanguageCell.describe)
        self.tableView.register(UINib(nibName: ContactCell.describe, bundle: nil), forCellReuseIdentifier: ContactCell.describe)
        self.tableView.register(UINib(nibName: SectionCell.describe, bundle: nil), forCellReuseIdentifier: SectionCell.describe)
        self.tableView.register(UINib(nibName: FeatureCell.describe, bundle: nil), forCellReuseIdentifier: FeatureCell.describe)
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
            
            if headerHeight <= endToDissapearAt {
                UIView.transition(with: self.headerView.backButton, duration: 0.3, options: .curveEaseInOut, animations: {
                    self.headerView.backButton.backgroundColor = UIColor.clear
                    self.headerView.backButton.setTitleColor(UIColor.pumpkin, for: .normal)
                })
            } else if headerHeight >= endToDissapearAt {
                UIView.transition(with: self.headerView.backButton, duration: 0.3, options: .curveEaseInOut, animations: {
                    self.headerView.backButton.backgroundColor = UIColor.pumpkin
                    self.headerView.backButton.setTitleColor(UIColor.white, for: .normal)
                })
            }
        }
    }
}

