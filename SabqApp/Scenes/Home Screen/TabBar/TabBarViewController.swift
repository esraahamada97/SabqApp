//
//  TabBarViewController.swift
//  sab2
//
//  Created by user on 10/17/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
var listModule = ListModule()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        setupTabBar()
        
       
    }
    
    func setupTabBar() {
        
        let homeViewController = createNaveController(
            tabsViewCotroller: HomeScreenViewController() ,
            selected: #imageLiteral(resourceName: "ic_newspaper_active"),
            unselected: #imageLiteral(resourceName: "ic_newspaper"),
            title: NSLocalizedString("news", comment: ""))
        let searchController = createNaveController( tabsViewCotroller: SearchScreenViewController(),
                                                     selected: #imageLiteral(resourceName: "ic_search_active"),
                                                     unselected: #imageLiteral(resourceName: "ic_search"),
                                                     title: NSLocalizedString("search", comment: ""))
        let popularController = createNaveController( tabsViewCotroller: PopularsScreenViewController(),
                                                      selected: #imageLiteral(resourceName: "ic_star_active"),
                                                      unselected: #imageLiteral(resourceName: "ic_star"),
                                                      title: NSLocalizedString("popular", comment: ""))
        let sectionsController = createNaveController( tabsViewCotroller: SectionsScreenViewController(),
                                                       selected: #imageLiteral(resourceName: "ic_list_active"),
                                                       unselected: #imageLiteral(resourceName: "ic_list"),
                                                       title: NSLocalizedString("sections", comment: ""))
        let choicesController = createNaveController( tabsViewCotroller: ChoicesScreenViewController(),
                                                      selected: #imageLiteral(resourceName: "ic_bookmark_active"),
                                                      unselected: #imageLiteral(resourceName: "ic_save_1"), title:  NSLocalizedString("choices", comment: ""))
        
        viewControllers = [homeViewController,
                           popularController,
                           sectionsController,
                           searchController,
                           choicesController]
        guard let items = tabBar . items else { return }
        
        for item in items {
           item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
    
    func createNaveController(tabsViewCotroller: UIViewController,
                              selected: UIImage,
                              unselected: UIImage,
                              title: String) -> UINavigationController {
        if (title == NSLocalizedString("news", comment: "") ) {
            let viewController = listModule.createModule()
            let navController = UINavigationController(rootViewController: viewController)
            navController.tabBarItem.title = title
            navController.tabBarItem.image = unselected
            navController.tabBarItem.selectedImage = selected
            return navController
        } else {
            let viewController = tabsViewCotroller
            let navController = UINavigationController(rootViewController: viewController)
            navController.tabBarItem.title = title
            navController.tabBarItem.image = unselected
            navController.tabBarItem.selectedImage = selected
            
            return navController}
    }
    
}
