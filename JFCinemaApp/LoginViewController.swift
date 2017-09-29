//
//  LoginViewController.swift
//  JFCinemaApp
//
//  Created by James Huang on 29/9/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for user in CrudAccess.sharedInstance.users {
            print(user.id!)
            print(user.username!)
            print(user.password!)
        }
    }
    
    @IBAction func userLogin(_ sender: UIButton) {
        for user in CrudAccess.sharedInstance.users {
            if (usernameTextField.text! == user.username! &&
                passwordTextField.text! == user.password!) {
                print("valid user")
                performSegue(withIdentifier: "loginSuccess", sender: nil)
            }
        }
    }
    
}
