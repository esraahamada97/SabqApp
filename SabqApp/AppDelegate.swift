//
//  AppDelegate.swift
//  sab2
//
//  Created by Lost Star on 10/16/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import GoogleSignIn
import TwitterKit
import UserNotifications
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    var window: UIWindow?
    var routingObject = Routing()
    static let twitterConsumerKey = "yyAb8n7V0xM1sO9vAO2cAb4wf"
    static let twitterConsumerSecret = "eQLkaKxshQP2bZnX1kZsQMZZDrgH8EmMlYlQFuwijU1PdmX0MZ"
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        GIDSignIn.sharedInstance().clientID = "52655393683-9fj8812e6d2h4pa02ubih9lflqm2k235.apps.googleusercontent.com"
//         GIDSignIn.sharedInstance().delegate = self
        //google with firebase
        FirebaseApp.configure()
//        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
//        GIDSignIn.sharedInstance().delegate = self
//
//        TWTRTwitter.sharedInstance().start(withConsumerKey: AppDelegate.twitterConsumerKey, consumerSecret: AppDelegate.twitterConsumerSecret)
//        registerForPushNotifications()
       // ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        let status = UserDefaults.standard.bool(forKey: "userlogin")
        routingObject.setWindow(windowFromAppDelegate: window ?? UIWindow())

//        if(status == true)
//        {
//        //loggedIn
//              setupNetworking()
//               routingObject.setWindowHome(windowFromAppDelegate:  window ?? UIWindow())
//        }
//        else
//        {
//        //not loggedIn
//            routingObject.setWindow(windowFromAppDelegate: window ?? UIWindow())
//        }
        return true
    }
    
    
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        
//        if (url.scheme == "twitterkit-yyab8n7v0xm1so9vao2cab4wf"){
//         return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
//        } else {
//             return GIDSignIn.sharedInstance().handle(url)
//        }
        let handled: Bool = ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[.sourceApplication] as? String, annotation: options[.annotation])
         return handled
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        UserDefaults.standard.set(true, forKey: "userlogin")
        setupNetworking()
        routingObject.setWindowHome(windowFromAppDelegate:  window ?? UIWindow())
     
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
          print("\(error.localizedDescription)")
        }
        return
      }
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                          accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { (authResult, error) in
          if let error = error {
            // ...
            return
          }
          // User is signed in
          // ...
        }
        
        let credentialFacebook = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
        Auth.auth().signIn(with: credentialFacebook) { (authResult, error) in
          if let error = error {
            // ...
            return
          }
          // User is signed in
          // ...
        }
     
    }
    
    func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
        if (extensionPointIdentifier == UIApplication.ExtensionPointIdentifier.keyboard) {
            return false
        }
        return true
    }
    
    
    
    func application(_ application: UIApplication,
                     open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        var handle: Bool = true
        
        
        let options: [String: AnyObject] = [UIApplication.OpenURLOptionsKey.sourceApplication.rawValue: sourceApplication as AnyObject, UIApplication.OpenURLOptionsKey.annotation.rawValue: annotation as AnyObject]
        
        handle = TWTRTwitter.sharedInstance().application(application, open: url, options: options)
        
        return handle
    }
    
    func registerForPushNotifications() {
       UNUserNotificationCenter.current()
          .requestAuthorization(options: [.alert, .sound, .badge]) {
            [weak self] granted, error in
              
            print("Permission granted: \(granted)")
            guard granted else { return }
            self?.getNotificationSettings()
        }
    }
        
    func getNotificationSettings() {
      UNUserNotificationCenter.current().getNotificationSettings { settings in
        print("Notification settings: \(settings)")
        guard settings.authorizationStatus == .authorized else { return }
        DispatchQueue.main.async {
          UIApplication.shared.registerForRemoteNotifications()
        }
      }
    }
    
    func application(
      _ application: UIApplication,
      didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
      let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
      let token = tokenParts.joined()
      print("Device Token: \(token)")
    }

    func application(
      _ application: UIApplication,
      didFailToRegisterForRemoteNotificationsWithError error: Error) {
      print("Failed to register: \(error)")
    }
    
}
