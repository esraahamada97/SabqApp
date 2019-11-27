//
//  ListActorsPresenter.swift
//  TMDB
//
//  Created by user on 9/30/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

class ListPresenter: BasePresenter, ListPresenterProtocal {
    var model: ListModelProtocal?
    var view: ListViewProtocal?
    var currentPage: Int = 1
    
    init(viewProtocole: ListViewProtocal, modelProtocol: ListModelProtocal ) {
        view = viewProtocole
        model = modelProtocol
        
    }
    
    required init(view: BaseViewProtocal, model: BaseModelProtocal) {
        fatalError("init(view:model:) has not been implemented")
    }
    func loadResponse() {
        model?.getResponse(forPage: currentPage) { success in
            if success {
                let sliderArray = self.model?.getSlider()
                self.view?.setSlider(array: sliderArray ?? [] )
                let materialsArray = self.model?.getMaterials()
                self.view?.setMaterial(array: materialsArray ?? [])
                
            } else {
                print("error")
            }
            
        }
    }
    func loadImage() {
        model?.getImagesResponse { result in
            switch result {
            case .success(let imagesResponse):
                
                // print(imagesResponse)
                self.view?.setImages(array: imagesResponse as? [Comics] ?? [])
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func loadVideos() {
        model?.getVideosResponse { result in
            switch result {
            case .success(let videosResponse):
                self.view?.setVideos(array: videosResponse as? [Comics] ?? [])
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func loadArticles() {
        model?.getArticlesResponse { result in
            switch result {
            case .success(let articlesResponse):
                self.view?.setArticles(array: articlesResponse as? [Materials] ?? [])
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
