//
//  SkillCell.swift
//  henrard
//
//  Created by Julien Henrard on 21/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit
import MXParallaxHeader

class SkillCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: Variables
    var skillsViewModel = [SkillViewModel]()

    var parentScrollView: MXScrollView? = nil
    var parentViewController: UIViewController? = nil

    // MARK: Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = UIColor.cloud
        self.collectionView.register(UINib(nibName: SkillCollectionCell.describe, bundle: nil), forCellWithReuseIdentifier: SkillCollectionCell.describe)

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 25
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: SkillCollectionCell.itemWidth, height: SkillCollectionCell.itemHeight)
        collectionView!.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10)
    }

    // MARK: UICollectionViewDelegate + DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return skillsViewModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SkillCollectionCell.describe, for: indexPath) as! SkillCollectionCell
        cell.set(with: self.skillsViewModel[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let skill = self.skillsViewModel[indexPath.row]
        let vc = DetailsPopUpViewController.instance()
        vc.set(with: skill)
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

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.parentScrollView?.isScrollEnabled = false
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.parentScrollView?.isScrollEnabled = true
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.parentScrollView?.isScrollEnabled = true
    }

}
