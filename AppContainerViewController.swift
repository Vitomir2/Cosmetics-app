//
//  AppContainerViewController.swift
//  Exam
//
//  Created by Vitomir on 2/11/17.
//  Copyright © 2017 Vitomir. All rights reserved.
//

import UIKit

class AppContainerViewController: UIViewController {

    var userLoggedIn: Bool! = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if (UserDefaults.standard.object(forKey: UserDefaultKeys.autoLoginEnabled.rawValue) as? Bool) != nil {
            self.userLoggedIn = true
        }
        else {
            userLoggedIn = false
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if userLoggedIn == true {
            self.performSegue(withIdentifier: "GoToMainControllerSegue", sender: nil)
        }
        else {
            self.performSegue(withIdentifier: "GoToLoginSegue", sender: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
