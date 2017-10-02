//
//  LoginViewController.swift
//  JFCinemaApp
//
//  Created by James Huang on 29/9/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginUser: mUser?

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for user in CrudAccess.sharedInstance.users {
            print(user.id!)
            print(user.username!)
            print(user.password!)
            print(user.tickets!)
        }
    }
    
    @IBAction func userLogin(_ sender: UIButton) {
<<<<<<< HEAD
=======
        
>>>>>>> ee6fd08bc5f64d7c9fcaf1222a5aa95b5d1e52c5
        //path of core data
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)
        print("\(path)")
        
        for user in CrudAccess.sharedInstance.users {
            if (usernameTextField.text! == user.username! &&
                passwordTextField.text! == user.password!) {
                print("valid user")
                loginUser = user
                performSegue(withIdentifier: "loginSuccess", sender: nil)
                Singleton.getInstance.currentUser = user
            }
            
            // If password is incorrect
            if (usernameTextField.text! == user.username! && passwordTextField.text! != user.password!) {
                print("invalid password")
                
                let alert = UIAlertController(title: "Error", message: "Invalid password", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Re-enter", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                // clear the fields
                //usernameTextField.text = ""
                passwordTextField.text = ""
            }

            // If password is incorrect
            if (usernameTextField.text! == user.username! && passwordTextField.text! != user.password!) {
                print("invalid password")
                
                let alert = UIAlertController(title: "Error", message: "Invalid password", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Re-enter", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                // clear the fields
                //usernameTextField.text = ""
                passwordTextField.text = ""
            }
        }
    }
}
