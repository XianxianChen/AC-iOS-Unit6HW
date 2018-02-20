//
//  FirebaseAPIClient.swift
//  AC-iOS-Unit6HW
//
//  Created by C4Q on 2/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class FirebaseAPIClient {
    static let manager = FirebaseAPIClient()
    private init() {}
    
    func loginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print("sign in error: \(error)")
            }
            if let user = user {
                print("signed user in: \(user.email)")
            }
        }
    }
    func creatNewAccout(email: String, password: String, displayName: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print("create new account error: \(error)")
            }
            if let user = user {
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = displayName
                print("created new user: \(user.displayName)")
            }
        }
    }
}
