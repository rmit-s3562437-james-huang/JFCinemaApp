//
//  RegisterViewController.swift
//  JFCinemaApp
//
//  Created by James Huang on 29/9/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    var user: mUser?
    let uuid = NSUUID().uuidString
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerUser(_ sender: UIButton) {
        CrudAccess.sharedInstance.createUser(id: uuid, username: usernameTextField.text!, password: passwordTextField.text!, existing: user)
        
        let alert = UIAlertController(title: "Success", message: "Account has been created", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: { action in
            self.performSegue(withIdentifier: "successfullyRegisteredSegue", sender: self)
        }))
        
        self.present(alert, animated: true, completion: nil)

    }
}
