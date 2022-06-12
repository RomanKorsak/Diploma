//
//  UserModel.swift
//  Diploma
//
//  Created by Роман Корсак on 30.05.22.
//

import Foundation
import Firebase

struct User {
    let uid: String
    let email: String
    
    init(user: Firebase.User) {
        self.uid = user.uid
        self.email = user.email ?? ""
    }
}
