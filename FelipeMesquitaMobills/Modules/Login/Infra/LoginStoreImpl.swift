//
//  LoginStoreImpl.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 24/05/21.
//

import Foundation

class LoginStoreImpl: LoginStore {
    var delegate: LoginStoreDelegate?
    
    var currentUser: UserData

    init(currentUser: UserData) {
        self.currentUser = currentUser
    }
}
