//
//  LoginViewController.swift
//  LoginProject
//
//  Created by Miguel Angel Moreno Armenteros on 10/12/14.
//  Copyright (c) 2014 Miguel Angel Moreno Armenteros. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, CreateAccountViewControllerDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonTapped(sender: UIButton) {
        let defaultsUsername = NSUserDefaults.standardUserDefaults().stringForKey(kUserNameKey)
        let defaultsPassword = NSUserDefaults.standardUserDefaults().stringForKey(kPasswordKey)
        
    
        let inputUsername = self.usernameTextField.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let inputPassword = self.passwordTextField.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        if countElements(inputUsername) > 0 && countElements(inputPassword) > 0 && defaultsUsername == inputUsername && defaultsPassword == inputPassword {
            self.performSegueWithIdentifier("loginToMainSegue", sender: self)
        }
    }
    
    @IBAction func createAccountButtonTapped(sender: UIButton) {
        self.performSegueWithIdentifier("loginToCreateAccountSegue", sender: self)
    }
    
    func accountCreated() {
        self.performSegueWithIdentifier("loginToMainSegue", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "loginToCreateAccountSegue" {
            let createAccountVC: CreateAccountViewController = segue.destinationViewController as CreateAccountViewController
            createAccountVC.delegate = self
        }
    }
}
