//
//  LoginStore.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 24/05/21.
//

import Foundation

protocol LoginStore {
    var delegate: LoginStoreDelegate? { get set }
    var currentUser: UserData { get }
}

protocol LoginStoreDelegate {
    func didLogout()
}
