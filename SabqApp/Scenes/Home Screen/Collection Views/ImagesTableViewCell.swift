//
//  ImagesTableViewCell.swift
//  sab2
//
//  Created by user on 10/23/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class ImagesTableViewCell: UITableViewCell {
    @IBOutlet weak private var imagesCollectionView: UICollectionView!
    var imagesAdapter = ImagesAdapter()
    let cellIdentifier = "ImagesCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setCollectionView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = UICollectionViewFlowLayout.automaticSize
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        self.imagesCollectionView.collectionViewLayout = flowLayout
        self.imagesCollectionView.dataSource = imagesAdapter
        self.imagesCollectionView.delegate = imagesAdapter
        
        let cellNib = UINib(nibName: cellIdentifier, bundle: nil)
        self.imagesCollectionView.register(cellNib, forCellWithReuseIdentifier: cellIdentifier)
    
    }
    
    func reloadCollectionView() {
        imagesCollectionView.reloadData()
    }
    
    func configurTableViewCell(imagesArray: [Comics]) {
        imagesAdapter.add(items: imagesArray)
        
    }
}
