//
//  SliderTableViewCell.swift
//  sab2
//
//  Created by user on 10/21/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit
class SliderTableViewCell: UITableViewCell {
    @IBOutlet weak private var sliderCollectionView: UICollectionView!
    @IBOutlet weak private var pageControl: UIPageControl!
    var sliderAdapter = SliderAdapter()
    let cellIdentifier = "SliderCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setCollectionView()
    }
    
    func setCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = UICollectionViewFlowLayout.automaticSize
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        self.sliderCollectionView.collectionViewLayout = flowLayout
        self.sliderCollectionView.dataSource = sliderAdapter
        self.sliderCollectionView.delegate = sliderAdapter
        let cellNib = UINib(nibName: cellIdentifier, bundle: nil)
        self.sliderCollectionView.register(cellNib, forCellWithReuseIdentifier: cellIdentifier)
        sliderAdapter.setAdaptor(pageControl: pageControl, sliderCollectionView: sliderCollectionView )
        self.pageControl.currentPage = 0
    }
    
    func reloadCollectionView() {
        sliderCollectionView.reloadData()
    }
    
    func configurTableViewCell(sliderArray: [Slider]) {
        sliderAdapter.add(items: sliderArray)
        self.pageControl.numberOfPages = sliderArray.count
    }
    
}
