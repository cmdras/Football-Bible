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
import FirebaseDatabase
class LoginViewController: UIViewController {
    
    var ref: FIRDatabaseReference!
    var userID: String?
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FIRAuth.auth()!.addStateDidChangeListener() { auth, user in
            if user != nil {
                self.userID = user!.uid
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
        
        self.passwordText.isSecureTextEntry = true
        ref = FIRDatabase.database().reference()

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
                    self.userID = user!.uid
                    self.ref.child("users").child(user!.uid).setValue(["Email": user!.email])
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                    let alertController = UIAlertController(title: "Oops", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
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
                    self.userID = user!.uid
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                    let alertController = UIAlertController(title: "Oops", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navVC = segue.destination as? UINavigationController {
            if let loginVC = navVC.topViewController as? ViewController {
                loginVC.userID = self.userID!
            }
            
        }
    }
    
}
