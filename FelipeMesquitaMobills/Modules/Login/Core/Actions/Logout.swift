//
//  Logout.swift
//  FelipeMesquita-Mobills
//
//  Created by Felipe Mesquita on 22/05/21.
//

import Foundation
import Combine

protocol Logout {
    func callAsFunction(completion: @escaping Handler<Error?>)
}

class LogoutImpl: Logout {
    let repository: LoginRepository
    
    init(repository: LoginRepository) {
        self.repository = repository
    }
    
    func callAsFunction(completion: @escaping Handler<Error?>) {
        self.repository.logout { error in
            if let error = error {
                completion(error)
            }
            else {
                completion(nil)
            }
        }
    }
}
