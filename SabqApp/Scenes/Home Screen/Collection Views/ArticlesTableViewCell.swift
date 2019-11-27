//
//  ArticlesTableViewCell.swift
//  sab2
//
//  Created by user on 10/27/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {
    @IBOutlet weak private var articlesCollectionView: UICollectionView!
    var articlesAdapter = ArticlesAdapter()
    let cellIdentifier = "ArticlesCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setCollectionView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = UICollectionViewFlowLayout.automaticSize
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 12
        flowLayout.minimumInteritemSpacing = 12
        self.articlesCollectionView.collectionViewLayout = flowLayout
        self.articlesCollectionView.dataSource = articlesAdapter
        self.articlesCollectionView.delegate = articlesAdapter
        
        let cellNib = UINib(nibName: cellIdentifier, bundle: nil)
        self.articlesCollectionView.register(cellNib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func reloadCollectionView() {
        articlesCollectionView.reloadData()
    }
    
    func configurTableViewCell(articlesArray: [Materials]) {
        articlesAdapter.add(items: articlesArray)
        
    }
}
