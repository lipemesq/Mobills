//
//  Login.swift
//  FelipeMesquita-Mobills
//
//  Created by Felipe Mesquita on 22/05/21.
//

import Foundation
import Combine

protocol LoginWithEmail {
    func callAsFunction(using credentials: LoginCredentials, onSucess: @escaping Handler<LoginStore>, onError: @escaping Handler<Error>)
}

class LoginWithEmailImpl: LoginWithEmail {
    let repository: LoginRepository
    
    init(repository: LoginRepository) {
        self.repository = repository
    }
    
    func callAsFunction(using credentials: LoginCredentials, onSucess: @escaping Handler<LoginStore>, onError: @escaping Handler<Error>) {
        self.repository.loginWithEmail(using: credentials, onSucess: { userData in
            let store = LoginStoreImpl(currentUser: userData)
            
            let defaults = UserDefaults()
            defaults.set(codableKey: .loggedUser, value: userData)
            
            onSucess(store)
        }, onError: { error in
            onError(error)
        })
    }

}
