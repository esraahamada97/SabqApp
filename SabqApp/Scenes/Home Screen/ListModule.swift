//
//  ListActorsModule.swift
//  TMDB
//
//  Created by user on 9/30/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
class  ListModule {
    func createModule() -> HomeScreenViewController {
        let view = HomeScreenViewController()
        let model = ListModel()
        let presenter = ListPresenter(viewProtocole: view, modelProtocol: model)
        view.setPresenter(presenter: presenter)
        return view
        
    }
   
}
