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
    mutating func setWindow(windowFromAppDelegate: UIWindow) {
        window = windowFromAppDelegate
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        let rootViewController = TabBarViewController()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
}
