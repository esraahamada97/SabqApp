//
//  ActionSheetViewController.swift
//  sab2
//
//  Created by user on 11/11/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import TwitterKit
import FBSDKCoreKit
import FBSDKLoginKit

class ActionSheetViewController: UIViewController {
    
    @IBOutlet weak private var googleButton: UIButton!
    @IBOutlet weak private var googleImageButton: UIButton!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        googleButton.layer.borderWidth = 1
        googleImageButton.layer.borderWidth = 1
        googleImageButton.layer.borderColor = UIColor.lightGray.cgColor
        googleButton.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func googleSigninButton(_ sender: Any) {
        //GIDSignIn.sharedInstance().signOut()
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        GIDSignIn.sharedInstance().signIn()
        print("esraaaa")
        
    }
    
    @IBAction func twitterLogin(_ sender: Any) {
        logoutTwitter()
        
        TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
            if (session != nil) {
                print("signed in as (String(describing: session?.userName))");
                self.appDelegate.routingObject.setWindowHome(windowFromAppDelegate: self.appDelegate.window ?? UIWindow())
            } else {
                print("error: (String(describing: error?.localizedDescription))");
            }
        })
        
    }
    func logoutTwitter() {
        let sessionStore = TWTRTwitter.sharedInstance().sessionStore
        if let userID = sessionStore.session()?.userID {
            sessionStore.logOutUserID(userID)
        }
    }
    
    
    @IBAction func facebookLoginAction(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email"], from: self) { (result, error) in
   if let error = error {
     print("Failed to login: \(error.localizedDescription)")
     return
   }
            guard let accessToken = AccessToken.current else {
     print("Failed to get access token")
     return
   }
   let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
   // Perform login by calling Firebase APIs
   Auth.auth().signInAndRetrieveData(with: credential) { (user, error) in
     if let error = error {
       print("Login error: \(error.localizedDescription)")
       let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
       let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
       alertController.addAction(okayAction)
       self.present(alertController, animated: true, completion: nil)
       return
     }
     // self.performSegue(withIdentifier: self.signInSegue, sender: nil)
   }
 }
   }
    
}
