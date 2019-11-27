//
//  VideosTableViewCell.swift
//  sab2
//
//  Created by user on 10/24/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class VideosTableViewCell: UITableViewCell {
    @IBOutlet weak private var videosCollectionView: UICollectionView!
    var videosAdapter = VideosAdapter()
    let cellIdentifier = "VideosCollectionViewCell"
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
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = UICollectionViewFlowLayout.automaticSize
        flowLayout.minimumLineSpacing = 14
        flowLayout.minimumInteritemSpacing = 14
        self.videosCollectionView.collectionViewLayout = flowLayout
        self.videosCollectionView.dataSource = videosAdapter
        self.videosCollectionView.delegate = videosAdapter
        
        let cellNib = UINib(nibName: cellIdentifier, bundle: nil)
        self.videosCollectionView.register(cellNib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func reloadCollectionView() {
        videosCollectionView.reloadData()
    }
    
    func configurTableViewCell(videosArray: [Comics]) {
        videosAdapter.add(items: videosArray)
    }
    
}
