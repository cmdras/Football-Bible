//
//  LoginViewController.swift
//  Football Bible
//
//  Created by Christopher Ras on 09/12/2016.
//  Copyright © 2016 Chris Ras. All rights reserved.
//
//  Firebase Login and Register Code adapted from https://www.youtube.com/watch?v=OaiLpVG6Tlc

import UIKit
import Firebase
class LoginViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func createAccountAction(_ sender: Any) {
        if self.emailText.text == "" || self.passwordText.text == "" {
            let alertController = UIAlertController(title: "Oops", message: "Please enter an email and password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        } else {
            FIRAuth.auth()?.createUser(withEmail: self.emailText.text!, password: self.passwordText.text!, completion: { (user, error) in
                if error == nil {
                    print("\(user!.email)")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                    let alertController = UIAlertController(title: "Oops", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                }
            })
            
        }
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if self.emailText.text == "" || self.passwordText.text == "" {
            let alertController = UIAlertController(title: "Oops", message: "Please enter an email and password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        } else {
            FIRAuth.auth()?.signIn(withEmail: self.emailText.text!, password: self.passwordText.text!, completion: { (user, error) in
                if error == nil {
                    print("\(user!.email)")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                    let alertController = UIAlertController(title: "Oops", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                }
            })
        }
    }
    
}
