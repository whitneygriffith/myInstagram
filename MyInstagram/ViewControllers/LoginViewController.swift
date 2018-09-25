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
        PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!){
            (user: PFUser?, error: Error?) -> Void in
            if user != nil {
                print ("logged in")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            if ((error) != nil) {
                let errorString = error?.localizedDescription
                let alertController = UIAlertController(title: "Try again", message: errorString, preferredStyle: .alert)
                
                // add ok button
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: {
                    (action) in
                })
                
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
            }
        
    }
    }

    @IBAction func SignUp(_ sender: Any) {
        
        let newUser = PFUser()
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
        
        newUser.signUpInBackground { (succeeded: Bool, error: Error?)-> Void in
            if succeeded{
                print("signed up")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
            }else{
                let errorString = error?.localizedDescription
                let alertController = UIAlertController(title: "Try again", message: errorString, preferredStyle: .alert)
                
                // add ok button
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: {
                    (action) in
                })
                
                alertController.addAction(okAction)
            }
        }
        
        
    }
}
