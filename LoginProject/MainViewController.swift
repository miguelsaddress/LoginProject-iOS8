//
//  MainViewController.swift
//  LoginProject
//
//  Created by Miguel Angel Moreno Armenteros on 10/12/14.
//  Copyright (c) 2014 Miguel Angel Moreno Armenteros. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let username = NSUserDefaults.standardUserDefaults().stringForKey(kUserNameKey)
        let password = NSUserDefaults.standardUserDefaults().stringForKey(kPasswordKey)
        self.usernameLabel.text = username
        self.passwordLabel.text = password
    }

}
