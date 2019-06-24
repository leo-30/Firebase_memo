//
//  ViewController.swift
//  Forebase_memo
//
//  Created by 原田澪 on 2019/06/19.
//  Copyright © 2019 原田澪. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    
    @IBOutlet var label: UILabel!
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    var veri:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        //        FirebaseApp.configure()
        //        label.text = FirebaseApp.app()?.name
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            return
        }
        guard let authentication = user.authentication else { return
        }
    }
    
}

