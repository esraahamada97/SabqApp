//
//  ActionSheetViewController.swift
//  sab2
//
//  Created by user on 11/11/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit
import GoogleSignIn
class ActionSheetViewController: UIViewController, GIDSignInDelegate {

    @IBOutlet weak private var googleButton: UIButton!
    @IBOutlet weak private var googleImageButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self

         // Automatically sign in the user.
         GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        // Do any additional setup after loading the view.
        googleButton.layer.borderWidth = 1
        googleImageButton.layer.borderWidth = 1
        googleImageButton.layer.borderColor = UIColor.lightGray.cgColor
        googleButton.layer.borderColor = UIColor.lightGray.cgColor
        GIDSignIn.sharedInstance().delegate = self
        //GIDSignIn.sharedInstance().uiDelegate = self
        
    }

    @IBAction func googleSigninButton(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
        print("esraaaa")
        
    }
   
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("Google Sing In didSignInForUser")
        
       
        if let error = error {
          print(error.localizedDescription)
          return
        }
    
      // Start Google OAuth2 Authentication
      func sign(_ signIn: GIDSignIn?, present viewController: UIViewController?) {
      
        // Showing OAuth2 authentication window
        if let aController = viewController {
          present(aController, animated: true) {() -> Void in }
        }
      }
      // After Google OAuth2 authentication
      func sign(_ signIn: GIDSignIn?, dismiss viewController: UIViewController?) {
        // Close OAuth2 authentication window
        dismiss(animated: true) {() -> Void in }
      }
}
}
