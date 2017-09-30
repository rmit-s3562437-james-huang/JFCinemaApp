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
        for user in CrudAccess.sharedInstance.users {
            if (usernameTextField.text! == user.username! &&
                passwordTextField.text! == user.password!) {
                print("valid user")
                loginUser = user
                performSegue(withIdentifier: "loginSuccess", sender: nil)
                Singleton.getInstance.currentUser = user
            }
        }
    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "userToTicket" {
//            if let ticketTable = segue.destination as? TicketTableViewController {
//                ticketTable.userId = loginUser?.id!
//                
//            }
//        }
//    }
    
}
