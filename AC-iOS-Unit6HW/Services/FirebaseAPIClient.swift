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
    
    func loginUser(email: String, password: String, completionHandler: @escaping  (User?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                completionHandler(nil, error)
            }
            if let user = user {
               completionHandler(user, nil)
            }
        }
    }
    func creatNewAccout(email: String, password: String, displayName: String, completionHandler: @escaping (User?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
              //  print("create new account error: \(error)")
                completionHandler(nil, error)
            }
            if let user = user {
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = displayName
                print("created new user: \(user.displayName)")
                changeRequest.commitChanges(completion: { (error) in
                    if let error = error {
                        print(error)
                    } else {
                        print("changed name to \(user.displayName)")
                    }
                })
                let userProfileRef = Database.database().reference().child("users")
              let userProfile = UserProfile(email: email, displayName: displayName, userID: user.uid)
                userProfileRef.childByAutoId().setValue(userProfile.toJson())
            completionHandler(user, nil)
            }
        }
    }
}
