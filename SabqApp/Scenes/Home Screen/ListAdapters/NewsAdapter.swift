//
//  NewsAdapter.swift
//  sab2
//
//  Created by user on 10/24/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import Foundation
import UIKit

class NewsAdapter: NSObject, ListAdapterProtocal, UITableViewDelegate,
UITableViewDataSource {
    
    typealias DataType = Materials
    var list: [Materials]?
    var sliderList = [Slider]()
    var imagesList = [Comics]()
    var videosList = [Comics]()
    var articlesList = [Materials]()
    var reloadData: (() -> Void)?
    var showEmptyState: ((Bool) -> Void)?
    
    func add(item: Materials) {}
    
    func add(items: [Materials]) {
        list = items
        
        reloadData?()
    }
    func addSlider(items: [Slider]) {
        sliderList = items
        reloadData?()
    }
    
    func addImages(items: [Comics]) {
        imagesList = items
        reloadData?()
    }
    
    func addVideos(items: [Comics]) {
        videosList = items
        reloadData?()
    }
    
    func addArticles(items: [Materials]) {
        articlesList = items
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            
        case 0:     return UITableView.automaticDimension 
        case 1:
            if (list?[indexPath.row].type == "images") {
                return UITableView.automaticDimension
            } else if (list?[indexPath.row].type == "videos") {
                return UITableView.automaticDimension
            } else if (list?[indexPath.row].type == "articles") {
                return 370
            } else { return UITableView.automaticDimension }
            
        default:    return 0
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:     return 1
        case 1:     return  list?.isEmpty ?? true ? 4 : count()
        default:    return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (list?.isEmpty ?? true) {
            switch indexPath.section {
            case 0 :
                guard let  cell = tableView.dequeueReusableCell(
                    withIdentifier: "SliderShimmerTableViewCell")
                    as? SliderShimmerTableViewCell else { fatalError("slider cell empty") }
                return cell
            case 1 ://first cells
                guard let  cell = tableView.dequeueReusableCell(
                    withIdentifier: "HomeShimmerTableViewCell")
                    as? HomeShimmerTableViewCell else { fatalError("slider cell empty") }
                return cell
                
            default :
                return UITableViewCell()

            }
        }
        switch indexPath.section {
        case 0: //Slider
            guard let  cell = tableView.dequeueReusableCell(
                withIdentifier: "SliderTableViewCell")
                as? SliderTableViewCell else { fatalError("slider cell empty") }
            //            cell.frame = tableView.bounds
            //            cell.layoutIfNeeded()
            cell.configurTableViewCell(sliderArray: sliderList)
            cell.reloadCollectionView()
            cell.windless.end()
            return cell
        case 1://first cells
            let materialsObj = list?[indexPath.row]
            if(materialsObj?.type == "images") {
                guard  let cell: ImagesTableViewCell = tableView.dequeueReusableCell(
                    withIdentifier: "ImagesTableViewCell",
                    for: indexPath) as? ImagesTableViewCell else { fatalError("image cell empty") }
                //                cell.frame = tableView.bounds
                //                cell.layoutIfNeeded()
                
                cell.configurTableViewCell(imagesArray: imagesList)
                //cell.reloadCollectionView()
                cell.windless.end()
                return cell
            } else  if(materialsObj?.type == "videos") {
                guard let cell: VideosTableViewCell = tableView.dequeueReusableCell(
                    withIdentifier: "VideosTableViewCell",
                    for: indexPath) as? VideosTableViewCell else { fatalError("videos cell empty") }
                //                cell.frame = tableView.bounds
                //                cell.layoutIfNeeded()
                cell.configurTableViewCell(videosArray: videosList)
                //cell.reloadCollectionView()
                cell.windless.end()
                return cell
            } else  if(materialsObj?.type == "articles") {
                guard  let cell: ArticlesTableViewCell = tableView.dequeueReusableCell(
                    withIdentifier: "ArticlesTableViewCell",
                    for: indexPath) as? ArticlesTableViewCell else { fatalError("articles cell empty") }
                //                cell.frame = tableView.bounds
                //                cell.layoutIfNeeded()
                cell.configurTableViewCell(articlesArray: articlesList)
                //cell.reloadCollectionView()
                cell.windless.end()
                return cell
            } else {
                guard let  cell = tableView.dequeueReusableCell(
                    withIdentifier: "HomeTableViewCell",
                    for: indexPath) as? HomeTableViewCell else { fatalError("home cell empty") }
                
                cell.configur(materials: materialsObj ?? Materials(type: "news"))
                cell.windless.end()
                return cell
            }
        default:
            return UITableViewCell()
        }
        }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
}
