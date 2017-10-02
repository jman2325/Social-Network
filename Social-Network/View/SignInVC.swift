//
//  ViewController.swift
//  Social-Network
//
//  Created by Jacob Bailey on 10/2/17.
//  Copyright © 2017 Jacob Bailey. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtn(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Jake: Unable to authenticate with facebook - \(String(describing: error))")
            } else if result?.isCancelled == true {
                print("Jake: User cancelled Facebook Authentication")
            } else {
                print("Jake: Successfully authenticated with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
                
            }
        }
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil {
                print("Jake: Unable to authenticate with Firebase - \(String(describing: error))")
            } else {
                print("Jake: Successfully authenticated with Firebase")
            }
        }
    }
    
    
    
}

