//
//  SignInViewController.swift
//  SnapChat
//
//  Created by Diego Gomez on 2017-04-20.
//  Copyright © 2017 Diego Gomez. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func SignUpTapped(_ sender: Any) {
        
        FIRAuth.auth()?.signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
            print("We tried to sign in")
            if error != nil {
                print("Hey we have an error")
                
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.self.passwordTextField.text!, completion: { (user, error) in
                    print("We tried to create a user")
                    
                    if error != nil {
                        print("Hey we have an error")
                    }else{
                        print("Created User Scuccessfully!")
                        self.performSegue(withIdentifier: "signinsegue", sender: nil)
                    }
                    
                })
                
            }else{
                print("Signed in Successfully")
            }
        })
        
        
    }
    
    
}
