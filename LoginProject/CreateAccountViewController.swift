//
//  CreateAccountViewController.swift
//  LoginProject
//
//  Created by Miguel Angel Moreno Armenteros on 10/12/14.
//  Copyright (c) 2014 Miguel Angel Moreno Armenteros. All rights reserved.
//

import UIKit

protocol CreateAccountViewControllerDelegate {
    func accountCreated()
}

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var chooseUsernameTextField: UITextField!
    @IBOutlet weak var choosePasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    var delegate: CreateAccountViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let n = countElements(kUserNameKey)
        println(n)
    }

    @IBAction func createAccountTapped(sender: UIButton) {
        let username = self.chooseUsernameTextField.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        if countElements(username) > 0 && self.choosePasswordTextField.text == self.confirmPasswordTextField.text {
            let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(self.chooseUsernameTextField.text, forKey: kUserNameKey)
            defaults.setObject(self.choosePasswordTextField.text, forKey: kPasswordKey)
            defaults.synchronize()
            self.dismissViewControllerAnimated(true, completion: nil)
            self.delegate?.accountCreated()
        }
    }

    @IBAction func cancelAccountTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
