//
//  SkillCell.swift
//  henrard
//
//  Created by Julien Henrard on 21/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class SkillCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Variables
    var skillsViewModel = [SkillViewModel]()
    
    // MARK: Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.register(UINib(nibName: SkillCollectionCell.describe, bundle: nil), forCellWithReuseIdentifier: SkillCollectionCell.describe)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 25
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: SkillCollectionCell.itemWidth, height: SkillCollectionCell.itemHeight)
        collectionView!.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10);
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
        print("touch")
    }
    
}
