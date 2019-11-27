//
//  LoginScreenViewController.swift
//  sab2
//
//  Created by user on 11/7/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit
import GoogleSignIn
import FittedSheets
 import AuthenticationServices

class LoginScreenViewController: UIViewController {
    var iconClick = true
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak private var passwordTextField: UITextField!
    
    @IBOutlet weak private var usernameTextField: UITextField!
    
    @IBOutlet weak private var loginButton: UIButton!
    var actionSheetController: ActionSheetViewController?
    var  sheetController: SheetViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    @IBAction func iconAction(_ sender: Any) {
        if(iconClick == true) {
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }

        iconClick = !iconClick
    }
    
     @IBAction func socialLoginAction(_ sender: Any) {
        
        actionSheetController = ActionSheetViewController()
        // It is important to set animated to false or it behaves weird currently

         sheetController = SheetViewController(
            controller: actionSheetController ?? UIViewController())
        sheetController?.preferredContentSize = CGSize(
            width: self.view.frame.size.width,
            height: self.view.frame.size.height / 2)

        self.present(sheetController ?? SheetViewController(), animated: false, completion: nil)

     }
    
    @IBAction func appleLogin(_ sender: Any) {
        performExistingAccountSetupFlows()
    }
    
    func performExistingAccountSetupFlows() {
               // Prepare requests for both Apple ID and password providers.
               let requests = [ASAuthorizationAppleIDProvider().createRequest()]
               
               // Create an authorization controller with the given requests.
               let authorizationController = ASAuthorizationController(authorizationRequests: requests)
            authorizationController.delegate = self as? ASAuthorizationControllerDelegate
            authorizationController.presentationContextProvider = self as? ASAuthorizationControllerPresentationContextProviding
               authorizationController.performRequests()
           }
           
           @objc
           func handleAuthorizationAppleIDButtonPress() {
               let appleIDProvider = ASAuthorizationAppleIDProvider()
               let request = appleIDProvider.createRequest()
               request.requestedScopes = [.fullName, .email]
               
               let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self as? ASAuthorizationControllerDelegate
            authorizationController.presentationContextProvider = self as? ASAuthorizationControllerPresentationContextProviding
               authorizationController.performRequests()
           }
}

extension LoginScreenViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if authorization.credential is ASAuthorizationAppleIDCredential {
            appDelegate.routingObject.setWindowHome(windowFromAppDelegate: appDelegate.window ?? UIWindow())
            
           
        }
    }

    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
    }
}


extension LoginScreenViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
