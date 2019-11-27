//
//  Routing.swift
//  sab2
//
//  Created by user on 11/5/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import Foundation
import UIKit
struct Routing {
    var window: UIWindow?
    var rootViewController: UIViewController?
//    mutating func setWindow(windowFromAppDelegate: UIWindow, viewController: UIViewController ) {
//        window = windowFromAppDelegate
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.backgroundColor = UIColor.white
//        if (viewController == TabBarViewController()){
//        rootViewController = TabBarViewController()
//        } else {
//            rootViewController = LoginScreenViewController()
//        }
//        window?.rootViewController = rootViewController
//        window?.makeKeyAndVisible()
//    }
    
    
    mutating func setWindow(windowFromAppDelegate: UIWindow ) {
           window = windowFromAppDelegate
           window = UIWindow(frame: UIScreen.main.bounds)
           window?.backgroundColor = UIColor.white
               rootViewController = ProfileViewController()
           
           window?.rootViewController = rootViewController
           window?.makeKeyAndVisible()
       }
    
    mutating func setWindowHome(windowFromAppDelegate: UIWindow ) {
              window = windowFromAppDelegate
              window = UIWindow(frame: UIScreen.main.bounds)
              window?.backgroundColor = UIColor.white
                  rootViewController = TabBarViewController()
              
              window?.rootViewController = rootViewController
              window?.makeKeyAndVisible()
          }
    
}
