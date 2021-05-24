//
//  LoginViewController.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 24/05/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        let email = emailField.text ?? ""
        let password = passwordField.text ?? ""
        
        let repo = LoginRepositoryFirebase()
        let doLogin = LoginWithEmailImpl(repository: repo)
        
        let credentials = LoginCredentials(email: email, password: password)
        doLogin(using: credentials) { userStore in
            let homeView = (self.storyboard?.instantiateViewController(identifier: "home")) as! HomeViewController
            
            homeView.moduleManager = ExpensesModuleManagerImpl(userStore: userStore)
            
            self.navigationController?.setViewControllers([homeView], animated: true)
        }
        onError: { error in
            print(error)
        }
    }
    
}
