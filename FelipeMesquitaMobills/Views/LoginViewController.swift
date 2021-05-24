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

        let defaults = UserDefaults()
        if let currentUser = defaults.get(codableKey: .loggedUser) {
            autoLogin(currentUser)
        }
    }
    
    private func autoLogin(_ user: UserData) {
        let homeView = (self.storyboard?.instantiateViewController(identifier: "home")) as! HomeViewController
        
        let userStore = LoginStoreImpl(currentUser: user)
        homeView.moduleManager = ExpensesModuleManagerImpl(userStore: userStore)
        
        self.navigationController?.setViewControllers([homeView], animated: true)
    }
    
    private func manualLogin() {
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

    @IBAction func loginButtonTapped(_ sender: Any) {
        manualLogin()
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        print("Error, unfortunaly this function was not implemented because the sad dev lacked time :( \n \(#function)")
    }
}
