//
//  LoginRepositoryFirebase.swift
//  FelipeMesquita-Mobills
//
//  Created by Felipe Mesquita on 22/05/21.
//

import Foundation
import Firebase

class LoginRepositoryFirebase: LoginRepository {
    func loginWithEmail(using credentials: LoginCredentials, onSucess: @escaping Handler<UserData>, onError: @escaping Handler<Error>) {
        Auth.auth().signIn(withEmail: credentials.email, password: credentials.password) { authResult, error in
            if error == nil, let user = authResult?.user {
                let userData = UserData(id: user.uid, displayName: user.displayName ?? "", credentials: credentials)
                onSucess(userData)
            }
            else {
                //print(error!.localizedDescription)
                //print((error! as NSError).userInfo)
                //let errorUserFriendlyDescription = (error! as NSError).userInfo["NSLocalizedDescription"] as? String ?? ""
                onError(error!)
            }
        }
    }
    
    func registerWithEmail(with data: UserData, onSucess: @escaping Handler<UserData>, onError: @escaping Handler<Error>) {
        Auth.auth().createUser(withEmail: data.credentials.email, password: data.credentials.password) { authResult, error in
            if error == nil, let user = authResult?.user {
                guard let displayName = user.displayName else {
                    onError(NSError())
                    return
                }
                
                let userData = UserData(id: user.uid, displayName: displayName, credentials: data.credentials)
                onSucess(userData)
            }
        }
    }
    
    func resetPassword(for email: String, completion: @escaping Handler<Error?>) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error != nil {
                completion(error)
            }
            else {
                completion(nil)
            }
        }
    }
    
    func logout(completion: @escaping Handler<Error?>) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch let signOutError as NSError {
            print(signOutError)
            completion(signOutError)
        }
    }
}
