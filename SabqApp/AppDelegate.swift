//
//  AppDelegate.swift
//  sab2
//
//  Created by Lost Star on 10/16/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var routingObject = Routing()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /// da yetfasaaaaaal
        setupNetworking()
        routingObject.setWindow(windowFromAppDelegate: window ?? UIWindow())
        
        return true
    }
}
