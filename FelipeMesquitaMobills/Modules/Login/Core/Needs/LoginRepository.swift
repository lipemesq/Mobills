//
//  LoginRepository.swift
//  FelipeMesquita-Mobills
//
//  Created by Felipe Mesquita on 22/05/21.
//

import Foundation
import Combine

protocol LoginRepository {
    func loginWithEmail(using credentials: LoginCredentials,
                        onSucess: @escaping Handler<UserData>,
                        onError: @escaping Handler<Error>)
    
    func registerWithEmail(with data: UserData,
                           onSucess: @escaping Handler<UserData>,
                           onError: @escaping Handler<Error>)
    
    func resetPassword(for email: String,
                       completion: @escaping Handler<Error?>)
    
    func logout(completion: @escaping Handler<Error?>)
}
