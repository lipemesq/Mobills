//
//  ResetPassword.swift
//  FelipeMesquita-Mobills
//
//  Created by Felipe Mesquita on 22/05/21.
//

import Foundation
import Combine

protocol ResetPassword {
    func callAsFunction(for email: String, completion: @escaping Handler<Error?>)
}

class ResetPasswordImpl: ResetPassword {
    let repository: LoginRepository
    
    init(repository: LoginRepository) {
        self.repository = repository
    }
    
    func callAsFunction(for email: String, completion: @escaping Handler<Error?>) {
        self.repository.resetPassword(for: email, completion: { error in
            if let error = error {
                completion(error)
            }
            else {
                completion(nil)
            }
        })
    }
}
