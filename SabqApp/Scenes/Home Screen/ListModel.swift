//
//  ListActorModel.swift
//  TMDB
//
//  Created by user on 9/29/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
class ListModel: BaseModel, ListModelProtocal {
    var networkManager = NetworkManager()
    var sliderArray: [Slider] = []
    var materialsArray: [Materials] = []
    var videosAraay: [Comics] = []
    var imagesArray: [Comics] = []
    var articlesArray: [Materials] = []
    
    func getResponse(forPage page: Int, compelation: @escaping (Bool) -> Void) {
        networkManager.getSlider_MaterialResponse(pageNumber: page) { result, _  in
            do {
                let response = try result.get()
                self.sliderArray = response.slider ?? []
                self.materialsArray = response.materials ?? []
                if (!self.imagesArray.isEmpty) {
                    self.materialsArray.insert(Materials(type: "images"), at: 9)
                }
                if (!self.videosAraay.isEmpty) {
                    self.materialsArray.insert(Materials(type: "videos"), at: 4)
                }
                if (!self.articlesArray.isEmpty) {
                    self.materialsArray.insert(Materials(type: "articles"), at: 13)
                }
                compelation(true)
            } catch {
                print(error.localizedDescription)
                compelation(false)
            }
            
        }
        
    }
    func getMaterials() -> [Materials] {
        return materialsArray
    }
    func getSlider() -> [Slider] {
        return sliderArray
    }
    func getVideosResponse(compelation: @escaping (Result<Any, Error>) -> Void) {
        networkManager.getVideosResponse { result, _  in
            do {
                let response = try result.get()
                //  guard  self.videosAraay != nil else {return}
                self.videosAraay = response.comics ?? []
                if(!self.materialsArray.isEmpty) {
                    if (self.materialsArray[4].type != "videos") {
                        self.materialsArray.insert(Materials(type: "videos"), at: 4)
                    }
                }
                compelation(.success(self.videosAraay) )
            } catch {
                print(error.localizedDescription)
                compelation(.failure(error))
            }
            
        }
    }
    
    func getImagesResponse(compelation: @escaping (Result<Any, Error>) -> Void) {
        networkManager.getImagesResponse { result, _  in
            do {
                if let response = try? result.get() {
                    self.imagesArray = response.comics ?? []
                    if(!self.materialsArray.isEmpty) {
                        if (self.materialsArray[9].type != "images") {
                            self.materialsArray.insert(Materials(type: "images"), at: 9)
                        }
                    }
                    compelation(.success(self.imagesArray))
                }
            }
            
        }
    }
    func getArticlesResponse( compelation: @escaping (Result<Any, Error> ) -> Void) {
        networkManager.getArticlesResponse { result, _  in
            do {
                if let response = try? result.get() {
                    //                guard  self.imagesArray != nil else {return}
                    self.articlesArray = response.materials ?? []
                    if(!self.materialsArray.isEmpty) {
                        if (self.materialsArray[13].type != "articles") {
                            self.materialsArray.insert(Materials(type: "articles"), at: 13)
                        }
                    }
                    compelation(.success(self.articlesArray)
                        
                    )
                }
            } 
            
        }
    }
    
}
