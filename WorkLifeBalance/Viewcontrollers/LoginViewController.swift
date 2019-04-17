//
//  ViewController.swift
//  WorkLifeBalance
//
//  Created by nikita lalwani on 4/11/19.
//  Copyright © 2019 nikita lalwani. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import GoogleSignIn


class LoginViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    

    @IBOutlet weak var loginView: LoginView!
    
    @IBOutlet weak var contentView: UIView!
    
    
    @IBOutlet weak var viewSwitch: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self

        // Do any additional setup after loading the view, typically from a nib.
 
        
        self.loginView.layer.cornerRadius = self.loginView.bounds.width/8
        self.loginView.backgroundColor = UIColor.darkPurpleColor
        
        
        let runkeeperSwitch = CustomSwitch(titles: ["Login", "Signup"])
        runkeeperSwitch.backgroundColor = UIColor.customPurpleColor
        runkeeperSwitch.selectedBackgroundColor = UIColor.darkPurpleColor
        runkeeperSwitch.titleColor = .white
        runkeeperSwitch.selectedTitleColor = .white
        runkeeperSwitch.titleFont = UIFont(name: "HelveticaNeue-Medium", size: 13.0)
        runkeeperSwitch.frame = self.viewSwitch.bounds
        runkeeperSwitch.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        runkeeperSwitch.autoresizesSubviews = true
        runkeeperSwitch.addTarget(self, action: #selector(self.switchValueDidChange(sender:)), for: .valueChanged)
       self.viewSwitch.layer.cornerRadius = runkeeperSwitch.layer.cornerRadius
       self.viewSwitch.addSubview(runkeeperSwitch)

    }

    @IBAction func facebookLoginButtonTapped(_ sender: Any) {
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.loginBehavior = FBSDKLoginBehavior.browser
        let facebookReadPermissions = ["public_profile", "email", "user_friends"]

        fbLoginManager.logIn(withReadPermissions: facebookReadPermissions, handler: { (result, error) -> Void in
            
            if (error == nil){
                if let resultObj = result {
                let fbloginresult : FBSDKLoginManagerLoginResult = resultObj
                    if  fbloginresult.isCancelled {
                    
                    } else {
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.fetchUserInfo()
                    fbLoginManager.logOut()
                }
                    }
            }
            }
        })
    }
    
    
    @IBAction func googleLoginTapped(_ sender: Any) {
    }
    
    
    @IBAction func twitterLoginTapped(_ sender: Any) {
    }
    
    func fetchUserInfo(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                }
            })
        }
    }
    

    func sign(inWillDispatch signIn: GIDSignIn!, error: Error?) {
      //  myActivityIndicator.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
    }
    
    @IBAction func didTapSignOut(_ sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
    }
    
    @IBAction func googleSignInTapped(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    @objc func switchValueDidChange(sender:Any?) {
        <#function body#>
    }
    
}

