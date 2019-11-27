//
//  ArticlesAdapter.swift
//  sab2
//
//  Created by user on 10/24/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import Foundation
import UIKit
class ArticlesAdapter: NSObject, ListAdapterProtocal, UICollectionViewDataSource,
    UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout {
    typealias DataType = Materials
    var list: [Materials]?
    var reloadData: (() -> Void)?
    var showEmptyState: ((Bool) -> Void)?
    
    func add(item: Materials) {}
    
    func getArticlesObj(index: Int) -> Materials {
        guard let listObj = list?[index] else {
            fatalError("no articles provided")
        }
        return listObj
    }
    func add(items: [Materials]) {
        list = [Materials]()
        list = items
        reloadData?()
    }
    
    func update(item: Materials) {}
    
    func count() -> Int {
        return list?.count ?? 0
    }
    
    func isLastIndex(index: IndexPath) -> Bool {
        
        return true
    }
    
    func clear(reload: Bool) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count()
    }
    
    func collectionView (
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let collectionCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ArticlesCollectionViewCell",
            for: indexPath) as? ArticlesCollectionViewCell
            else {
                fatalError("cell empty")
        }
        
       guard let articlesObj = list?[indexPath.row] else { fatalError("no object") }
        
        collectionCell.configur(articlesObj: articlesObj)
        return collectionCell
        
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 2  ,
                      height: collectionView.frame.size.height - 190)
    }
    
}
