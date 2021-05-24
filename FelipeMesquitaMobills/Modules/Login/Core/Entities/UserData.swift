//
//  UserData.swift
//  FelipeMesquita-Mobills
//
//  Created by Felipe Mesquita on 22/05/21.
//

import Foundation

struct UserData: Equatable {
    var id: String
    var displayName: String
    
    var credentials: LoginCredentials
    
    var email: String {
        credentials.email
    }
}
