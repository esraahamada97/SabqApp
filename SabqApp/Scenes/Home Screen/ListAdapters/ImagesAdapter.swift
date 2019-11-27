//
//  ImagesAdapter.swift
//  sab2
//
//  Created by user on 10/24/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import Foundation
import UIKit

class ImagesAdapter: NSObject, ListAdapterProtocal, UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout {
    typealias DataType = Comics
    var list: [Comics]?
    var reloadData: (() -> Void)?
    var showEmptyState: ((Bool) -> Void)?
    
    func add(item: Comics) {}
    
    func getImagessObj(index: Int) -> Comics {
        guard let listObj = list?[index] else {
            fatalError("no comics provided")
        }
        return listObj
    }
    func add(items: [Comics]) {
        list = [Comics]()
        list = items
        reloadData?()
    }
    
    func update(item: Comics) {}
    
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
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let  collectionCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ImagesCollectionViewCell" ,
            for: indexPath) as? ImagesCollectionViewCell  else {
                fatalError("cell empty")
        }
        
      guard  let imagesObj = list?[indexPath.row] else { fatalError("no object") }
        collectionCell.configur(imagesObj: imagesObj)
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - 71,
                      height: collectionView.frame.size.height)
    }
    
}
