//
//  Register.swift
//  FelipeMesquita-Mobills
//
//  Created by Felipe Mesquita on 22/05/21.
//

import Foundation
import Combine

protocol RegisterWithEmail {
    func callAsFunction(with data: UserData, completion: @escaping Handler<Error?>)
}

class RegisterWithEmailImpl: RegisterWithEmail {
    let repository: LoginRepository
    
    init(repository: LoginRepository) {
        self.repository = repository
    }
    
    func callAsFunction(with data: UserData, completion: @escaping Handler<Error?>) {
        self.repository.registerWithEmail(with: data, onSucess: { userData in
            completion(nil)
        }, onError: { error in
            completion(error)
        })
    }
}
