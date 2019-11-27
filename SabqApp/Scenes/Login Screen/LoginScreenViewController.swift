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

class LoginScreenViewController: UIViewController {
    var iconClick = true

    @IBOutlet weak private var passwordTextField: UITextField!
    
    @IBOutlet weak private var usernameTextField: UITextField!
    
    @IBOutlet weak private var loginButton: UIButton!
    var controller: ActionSheetViewController?
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
        
        controller = ActionSheetViewController()
        // It is important to set animated to false or it behaves weird currently

         sheetController = SheetViewController(
            controller: controller ?? UIViewController())
        sheetController?.preferredContentSize = CGSize(
            width: self.view.frame.size.width,
            height: self.view.frame.size.height / 2)

        self.present(sheetController ?? SheetViewController(), animated: false, completion: nil)

     }
    
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
