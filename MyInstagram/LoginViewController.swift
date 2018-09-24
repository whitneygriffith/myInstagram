//
//  LoginViewController.swift
//  MyInstagram
//
//  Created by Whitney Griffith on 9/23/18.
//  Copyright © 2018 Whitney Griffith. All rights reserved.
//

import UIKit

import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signIn(_ sender: Any) {
    }
    

    @IBAction func SignUp(_ sender: Any) {
        
        let newUser = PFUser()
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
        
        newUser.signUpInBackground { (succeeded: Bool, error: Error?)-> Void in
            if succeeded{
                print("hola")
            }else{
                print(error)
            }
        }
        
        
    }
}
